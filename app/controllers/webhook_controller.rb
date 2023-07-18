class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:data_fintoc]
  skip_before_action :authenticate_user!, only: [:data_fintoc]

  require 'json'

  def data_fintoc
    payload = request.body.read
    event = nil
    link_token = params.dig(:data, :link_token)
    puts link_token
    fintoc_account = FintocAccount.create(widget_token: link_token)
    puts fintoc_account.inspect

    begin
      # Parse JSON payload
      event = JSON.parse(payload)
    rescue JSON::ParserError => e
      # Invalid payload
      render json: { error: 'Invalid payload' }, status: 400
      return
    end

    seen_event = WebhookEvent.find_by(fintoc_event_id: event['id'])
    if seen_event
      render json: { message: 'Event already processed' }, status: 200
      return
    end

    # Save new event for idempotency
    new_event = WebhookEvent.create!(fintoc_event_id: event['id'])

    # Handle the event
    case event['type']
    when 'link.created'
      if link_token.present?
        if fintoc_account.errors.any?
          puts fintoc_account.errors.full_messages
        end
      else
        puts 'No link_token in the event'
      end
    when 'link.credentials_changed'
      link_id = event.dig('data', 'id')
      # Define and call a method to handle the event.
    when 'link.refresh_intent.succeeded'
      link_id = event.dig('data', 'refreshed_object_id')
      # Define and call a method to handle the link refreshed event.
    when 'account.refresh_intent.succeeded'
      account_id = event.dig('data', 'refreshed_object_id')
      # Define and call a method to handle the account refreshed event.
    else
      # Unexpected event type
      puts "Unhandled event type: #{event['type']}"
    end

    render json: { message: 'Webhook received' }, status: 200
  end

  # Crea un hash para almacenar los datos requeridos
data = {
  links_created: 0,
  refresh_intent_succeeded: 0,
  accounts_refreshed: 0,
  new_movements: 0
}

# Itera sobre las líneas del log
log.each_line do |line|
  if line.include?("link.created")
    data[:links_created] += 1
  elsif line.include?("account.refresh_intent.succeeded")
    data[:refresh_intent_succeeded] += 1
    data[:accounts_refreshed] += 1
    match = line.match(/"new_movements"=>(\d+)/)
    data[:new_movements] += match[1].to_i if match
  end
end

puts "Número de links creados: #{data[:links_created]}"
puts "Número de refresh_intent_succeeded: #{data[:refresh_intent_succeeded]}"
puts "Número de cuentas actualizadas: #{data[:accounts_refreshed]}"
puts "Total de nuevos movimientos: #{data[:new_movements]}"

end
