class WebhookController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:data_fintoc]
  skip_before_action :authenticate_user!, only: [:data_fintoc]

  require 'json'

  def data_fintoc
    payload = request.body.read
    puts "Payload: #{payload}"

    event = nil

    begin
      event = JSON.parse(payload)
    rescue JSON::ParserError => e
      # Invalid payload
      render json: { error: 'Invalid payload' }, status: 400
      return
    end

    # # idempotency using ActiveRecord
    # seen_event = WebhookEvent.find_by(fintoc_event_id: event['id'])
    # if seen_event
    #   render json: { message: 'Event already processed' }, status: 200
    #   return
    # end

    # save new event for idempotency
    new_event = WebhookEvent.create!(
      fintoc_event_id: event['id'],
      # type: event['type'],
      # data: event['data']
    )

    # Handle the event
    case event['type']
    when 'link.created'
      link_token = new_event.data['link_token']
      puts "Link token: #{link_token}"
      name = new_event.data['holder_name'] # Assuming the name is in the 'holder_name' field
      FintocAccount.create(widget_token: link_token, name: name)
      # bank_account_id = session[:bank_account_id] # Make sure to set this in your application properly

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
      # Unexpected event type
      puts "Unhandled event type: #{event['type']}"
    end

    render json: { message: 'Webhook received' }, status: 200
  end
end
