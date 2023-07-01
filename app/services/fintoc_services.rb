require 'uri'
require 'net/http'
require 'openssl'
require 'fintoc'

class FintocService
  def self.get_movements(account_id, link_token, api_key)
    client = Fintoc::Client.new(api_key)
    link = client.get_link(link_token)
    account = link.find(id: account_id)
    account.get_movements
  end

  def self.get_movement_details(account_id, movement_id, link_token, api_key)
    client = Fintoc::Client.new(api_key)
    link = client.get_link(link_token)
    account = link.find(id: account_id)
    account.get_movements.to_a.select { |m| m.id == movement_id }
  end

  def self.get_account_info(link_token, api_key)
    client = Fintoc::Client.new(api_key)
    link = client.get_link(link_token)
    link.accounts
  end
end

def self.create_payment_intent(payment_intent_details, api_key)
  url = "https://api.fintoc.com/v1/payment_intents"
  headers = {
    'Accept' => 'application/json',
    'Authorization' => api_key,
    'Content-Type' => 'application/json'
  }
  body = payment_intent_details.to_json
  HttpClient.post(url, headers, body)
end


class HttpClient
  def self.call_api(url, headers)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri, headers)
    response = http.request(request)
    raise "HTTP Request Failed: #{response.message}" unless response.is_a?(Net::HTTPSuccess)

    response.read_body
  end

  def self.post(url, headers, body)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri, headers)
    request.body = body
    response = http.request(request)
    raise "HTTP Request Failed: #{response.message}" unless response.is_a?(Net::HTTPSuccess)

    JSON.parse(response.read_body)
  end
end
