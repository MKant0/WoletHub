class WebhookController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:data_fintoc]
  skip_before_action :authenticate_user!, only: [:data_fintoc]

  require 'json'

  def data_fintoc
    payload = request.body.read
      puts "AQUI VA EL PAYLOAD $$$$$$$$#{payload}"
      event = nil
  end
    #   payload = request.body.read
    #   puts "AQUI VA EL PAYLOAD $$$$$$$$#{payload}"
    #   event = nil

    #   begin
    #     event = JSON.parse(payload)
    #   rescue JSON::ParserError => e
    #     # Invalid payload
    #     status 400
    #     return
    #   end

    #   # idempotency using sinatra-activerecord
    #   seen_event = WebhookEvent.find_by(fintoc_event_id: event['id'])
    #   if seen_event
    #     status 200
    #     return
    #   end

    #   # save new event for idempotency
    #   new_event = WebhookEvent.create!(
    #     fintoc_event_id: event['id'],
    #     type: event['type'],
    #     data: event['data']
    #   )
    #   params[:new_event] = new_event
    # # Handle the event
    # case event['type']
    # when 'link.created'
    #   link_token = new_event['data']['link_token']
    #   FintocAccount.create(widget_token: link_token, name: name)
    #   bank_account_id = session[:bank_account_id]

    #   when 'link.credentials_changed'
    #     link_id = event['data']['id']
    #     # Then define and call a method to handle the event.
    #   when 'link.refresh_intent.succeeded'
    #     link_id = event['data']['refreshed_object_id']
    #     # Then define and call a method to handle the link refreshed event.
    #   when 'account.refresh_intent.succeeded'
    #     account_id = event['data']['refreshed_object_id']
    #     # Then define and call a method to handle the account refreshed event.
    #   # ... handle other event types
    #   else
    #     # Unexpected event type
    #     puts "Unhandled event type: #{event.type}"
    #   end

    #   status 200
end
