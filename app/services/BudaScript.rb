require 'dotenv/load'
require_relative 'app/services/buda_services'

# Obtiene la información de la cuenta
def get_account_info
  api_key = ENV['BUDA_API_KEY']
  secret_key = ENV['BUDA_SECRET_KEY']

  account_info = BudaService.get_account_info(api_key, secret_key)
  puts "Account Info: #{account_info}"
end

get_account_info
