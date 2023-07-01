class FintocService
  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'fintoc'

  def self.get_movements(account_id, link_token, api_key)
    call_fintoc_api("https://api.fintoc.com/v1/accounts/#{account_id}/movements", link_token, api_key)
  end

  def self.get_movement_details(account_id, movement_id, link_token, api_key)
    call_fintoc_api("https://api.fintoc.com/v1/accounts/#{account_id}/movements/#{movement_id}", link_token, api_key)
  end

  def self.get_account_info(link_token, api_key)
    call_fintoc_api("https://api.fintoc.com/v1/accounts", link_token, api_key)
  end
  private

  def self.call_fintoc_api(url, link_token, api_key)
    uri = URI("#{url}?link_token=#{link_token}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri)
    request["accept"] = 'application/json'
    request["Authorization"] = api_key
    response = http.request(request)
    puts "Response HTTP Status Code: #{response.code}"
    puts "Response Body: #{response.body}"
    response.read_body
  end
end
