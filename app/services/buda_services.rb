require 'net/http'
require 'openssl'
require 'uri'
#require 'dotenv'
require 'json'

#Dotenv.load('.env') # Carga las variables de entorno del archivo .env

class BudaServices
  attr_reader :key, :secret

  def initialize
    @key = ENV['BUDA_API_KEY']
    @secret = ENV['BUDA_SECRET_KEY']
  end

  def create_hmac_sha384(key, message)
    digest = OpenSSL::Digest.new('SHA384')
    hmac = OpenSSL::HMAC.hexdigest(digest, key, message)
    hmac
  end

  def make_request(request_method, request_path, body = nil)
    nonce = (Time.now.to_f * 1000).to_i.to_s
    message = "#{request_method} #{request_path} #{nonce}"

    signature = create_hmac_sha384(secret, message)

    uri = URI("https://www.buda.com#{request_path}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = case request_method
              when 'GET'
                Net::HTTP::Get.new(uri.request_uri)
              when 'POST'
                Net::HTTP::Post.new(uri.request_uri)
              end
    request['X-SBTC-APIKEY'] = key
    request['X-SBTC-SIGNATURE'] = signature
    request['X-SBTC-NONCE'] = nonce
    request['Content-Type'] = 'application/json'
    request.body = body if body

    response = http.request(request)

    puts "Respuesta recibida. Código de estado HTTP: #{response.code}"
    puts response.body
  end

  def fetch_user_info
    make_request('GET', '/api/v2/me')
  end

  def fetch_balances(currency = nil)
    request_path = "/api/v2/balances#{"/" + currency if currency}"
    make_request('GET', request_path)
  end

  def create_order(market_id:, order_type:, price_type:, limit:, amount:, client_id:)
    body = {
      'type': order_type,
      'price_type': price_type,
      'limit': limit,
      'amount': amount,
      'client_id': client_id
    }.to_json
    make_request('POST', "/api/v2/markets/#{market_id}/orders", body)
  end
end
