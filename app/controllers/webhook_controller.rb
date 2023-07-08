class WebhookController < ApplicationController

  require 'json'

  def data_fintoc
    # Using Sinatra
    #post '/webhook' do
    payload = request.body.read
    event = nil

    begin
      event = JSON.parse(payload)
      rescue JSON::ParserError => e
      # Invalid payload
      status 400
      return
    end

      # idempotency using sinatra-activerecord
    seen_event = WebhookEvent.find_by(fintoc_event_id: event['id'])
      if seen_event
        status 200
        return
      end

      # save new event for idempotency
    new_event = WebhookEvent.create!(
      fintoc_event_id: event['id'],
      type: event['type'],
      data: event['data']
    )

    # Handle the event
    case event['type']
    when 'link.credentials_changed'
      link_id = event['data']['id']
      # Then define and call a method to handle the event.
    when 'link.refresh_intent.succeeded'
      link_id = event['data']['refreshed_object_id']
      # Then define and call a method to handle the link refreshed event.
    when 'account.refresh_intent.succeeded'
      account_id = event['data']['refreshed_object_id']
      # Then define and call a method to handle the account refreshed event.
    # ... handle other event types
    else
      # Unexpected event type
      puts "Unhandled event type: #{event.type}"
    end

    status 200
  end
end
