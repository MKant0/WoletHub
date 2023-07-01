require 'net/http'
require 'openssl'
require 'uri'
require 'json'
require 'dotenv'

Dotenv.load('.env') # Carga las variables de entorno del archivo .env

def create_hmac_sha384(key, message)
  digest = OpenSSL::Digest.new('SHA384')
  hmac = OpenSSL::HMAC.hexdigest(digest, key, message)
  hmac
end

def create_crypto_deposit(key, secret, currency)
  request_path = "/api/v2/currencies/#{currency}/receive_addresses"

  make_request(key, secret, 'POST', request_path)
end

def get_crypto_deposit_address(key, secret, currency, address_id)
  request_path = "/api/v2/currencies/#{currency}/receive_addresses/#{address_id}"

  make_request(key, secret, 'GET', request_path)
end

def get_order_status(key, secret, market_id, state = nil)
  request_path = "/api/v2/markets/#{market_id}/orders"
  request_path += "?state=#{state}" if state

  make_request(key, secret, 'GET', request_path)
end

def create_clp_withdrawal(key, secret, amount, simulate = false)
  request_path = "/api/v2/currencies/clp/withdrawals"

  make_request(key, secret, 'POST', request_path, {
    'amount' => amount,
    'simulate' => simulate
  })
end

def make_request(key, secret, request_method, request_path, body = nil)
  # Información de la solicitud
  nonce = (Time.now.to_f * 1000).to_i.to_s
  message = "#{request_method} #{request_path} #{nonce}"
  message += " #{JSON.generate(body).gsub(/[\s+]/,'')}" if body

  puts "Creando la firma HMAC SHA384..."
  # Crear la firma HMAC
  signature = create_hmac_sha384(secret, message)

  # Crear la solicitud HTTP
  uri = URI("https://www.buda.com#{request_path}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  request = request_method == 'GET' ? Net::HTTP::Get.new(uri.request_uri) : Net::HTTP::Post.new(uri.request_uri)
  request['X-SBTC-APIKEY'] = key
  request['X-SBTC-SIGNATURE'] = signature
  request['X-SBTC-NONCE'] = nonce
  request['Content-Type'] = 'application/json'
  request.body = body.to_json if body

  puts "Enviando la solicitud a Buda.com..."
  # Enviar la solicitud
  response = http.request(request)

  # Imprimir la respuesta
  puts "Respuesta recibida. Código de estado HTTP: #{response.code}"
  puts response.body
end

puts "Cargando las claves de API desde .env..."
# Claves de API
key = ENV['BUDA_API_KEY']
secret = ENV['BUDA_SECRET_KEY']

# Hacer la solicitud de información personal
puts "Obteniendo información personal..."
make_request(key, secret, 'GET', '/api/v2/me')

# Hacer la solicitud de balances
puts "Obteniendo balances..."
make_request(key, secret, 'GET', '/api/v2/balances')

# Crear una nueva orden de compra
puts "Creando una orden..."
make_request(key, secret, 'POST', '/api/v2/markets/btc-clp/orders', {
  'type' => 'Bid',
  'price_type' => 'limit',
  'limit' => {'price' => 1000000, 'type' => 'gtc'},
  'amount' => 0.05,
  'client_id' => 'my-order-1'
})
# Obtener el estado de una orden en un mercado específico
market_id = 'btc-clp'
state = 'filled' # Opcional: Puedes cambiar el estado aquí o dejarlo en nil para obtener todas las órdenes
get_order_status(key, secret, market_id, state)

# Crear un retiro de CLP
amount = 5000
simulate = true # Opcional: Puedes cambiar el valor a false si deseas hacer una solicitud de retiro real
create_clp_withdrawal(key, secret, amount, simulate)


# Generar un abono en criptomoneda
currency = 'btc'
create_response = create_crypto_deposit(key, secret, currency)

if create_response.code == '200'
  address_id = JSON.parse(create_response.body)['receive_address']['id']
  puts "Esperando que la nueva dirección esté lista..."
  sleep(3) # Esperar 3 segundos

  # Obtener la dirección de abono en criptomoneda
  get_response = get_crypto_deposit_address(key, secret, currency, address_id)
  puts get_response.body if get_response.code == '200'
else
  puts "Error al generar el abono en criptomoneda"
  puts create_response.body
end
