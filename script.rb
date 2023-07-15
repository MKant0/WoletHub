# module DataFintoc

  require 'fintoc'
  #require 'dotenv/load'
  require 'net/http'
  require 'uri'
  require 'json'

  # Obtiene los movimientos de una cuenta específica
  def get_account_info
    link_token = ENV['FINTOC_LINK_TOKEN']
    api_key = ENV['FINTOC_API_KEY']


    client = Fintoc::Client.new(api_key)
    link = client.get_link(link_token)
    accounts = link.accounts
    #  accounts
    puts "Accounts: #{accounts}"
    # FintocAccount.create(bank_account_id: accounts[0].id, name: accounts[0].name, account_type: accounts[0].official_name)
  end

  def get_movements
    account_id = 'acc_pjGbKqETYAvKrV5E' # Reemplaza con el ID de la cuenta real
    link_token = ENV['FINTOC_LINK_TOKEN']
    api_key = ENV['FINTOC_API_KEY']

    client = Fintoc::Client.new(api_key)
    link = client.get_link(link_token)
    account = link.find(id: account_id)

    movements = account.get_movements.to_a
    puts "Movements: #{movements}"
    #guardarlo en @movements
    #una vez guardado en la variable, pasarlo a lo que tengo en la bbdd, su tabla con un each do.
    #y ahi guardarlo en la bbdd
    #y luego mostrarlo en la vista
  end

  def get_movement_details(movement_id)
    account_id = 'acc_pjGbKqETYAvKrV5E' # Reemplaza con el ID de la cuenta real
    link_token = ENV['FINTOC_LINK_TOKEN']
    api_key = ENV['FINTOC_API_KEY']

    client = Fintoc::Client.new(api_key)
    link = client.get_link(link_token)
    account = link.find(id: account_id)
    puts "Account: #{account}"
    puts "Link: #{link}"

    movement = account.get_movements.to_a.select { |m| m.id == movement_id }
    puts "Movement details: #{movement}"
  end

  def create_payment_intent
    api_key = ENV['FINTOC_API_KEY']

    payment_intent = {
      amount: 1000,
      currency: 'clp',
      recipient_account: {
        holder_id: '193426816',
        number: '1836027172',
        type: 'checking_account',
        institution_id: 'cl_banco_de_chile'
      }
    }

    uri = URI("https://api.fintoc.com/v1/payment_intents")
    header = {
      'Content-Type' => 'application/json',
      'Authorization' => api_key
    }

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true # this is the important line
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = payment_intent.to_json

    response = http.request(request)

    puts "Payment intent response: #{response.body}"

    uri2 = URI("https://webview.fintoc.com/widget?public_key=pk_test_xwUGiHD3-zsftKEioAvCGjAk6qQrTS65&holder_type=individual&product=payments&country=cl&widget_token=#{response.body['widget_token']}")
  end

  puts get_account_info
  #get_movements
  #get_movement_details('mov_JP6YByH6j4A3e4OM') # Reemplaza con el ID del movimiento real
  #create_payment_intent
# end
