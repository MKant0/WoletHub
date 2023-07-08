class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:data_fintoc]
  require 'json'

  def data_fintoc
    payload = request.body.read
    event = nil

    begin
      event = JSON.parse(payload)
    rescue JSON::ParserError => e
      render plain: 'Invalid payload', status: 400
      return
    end

    seen_event = WebhookEvent.find_by(fintoc_event_id: event['id'])
    if seen_event
      render plain: 'Event already processed', status: 200
      return
    end

    new_event = WebhookEvent.create!(
      fintoc_event_id: event['id'],
      type: event['type'],
      data: event['data']
    )

    # Handle the event
    case event['type']
    when 'link.created'
      link_token = event['data']['link_token']
      # Aquí creas el objeto Link en tu base de datos
      Link.create!(link_token: link_token)
    when 'link.credentials_changed'
      link_id = event['data']['id']
      # Then define and call a method to handle the event.
    when 'link.refresh_intent.succeeded'
      link_id = event['data']['refreshed_object_id']
      # Then define and call a method to handle the link refreshed event.
    when 'account.refresh_intent.succeeded'
      account_id = event['data']['refreshed_object_id']
      # Then define and call a method to handle the account refreshed event.
    else
      puts "Unhandled event type: #{event['type']}"
    end

    render plain: 'Event processed successfully', status: 200
  end
end
