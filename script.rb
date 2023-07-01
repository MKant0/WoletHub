require 'dotenv/load'
require_relative 'app/services/fintoc_services'

# Obtiene los movimientos de una cuenta específica
def get_movements
  account_id = 'acc_pjGbKqETYAvKrV5E' # Reemplaza con el ID de la cuenta real
  link_token = ENV['FINTOC_LINK_TOKEN']
  api_key = ENV['FINTOC_API_KEY']

  movements = FintocService.get_movements(account_id, link_token, api_key)
  puts "Movements: #{movements}"
end

get_movements
