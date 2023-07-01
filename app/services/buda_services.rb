require 'openssl'

class BudaService
  def self.create_hmac_sha384(key, message)
    digest = OpenSSL::Digest.new('SHA384')
    hmac = OpenSSL::HMAC.hexdigest(digest, key, message)
    hmac
  end

  def self.get_account_info
    api_key = ENV['BUDA_API_KEY']
    secret_key = ENV['BUDA_SECRET_KEY']
    endpoint = 'https://api.buda.com/v2/me'
    timestamp = Time.now.to_i
    message = "GET /api/v2/me #{timestamp}"
    hmac = create_hmac_sha384(secret_key, message)

    uri = URI(endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = api_key
    request['X-Signature'] = hmac
    request['X-Unix-Timestamp'] = timestamp.to_s

    response = http.request(request)
    response_body = response.body

    # Procesa la respuesta de la API de Buda.com según tus necesidades
    # y devuelve los datos relevantes

    response_body
  end

  # ...
  # Aquí irán los métodos para hacer las llamadas a la API de Buda.com
end
