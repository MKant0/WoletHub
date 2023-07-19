class WebhookController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:data_fintoc]
  skip_before_action :authenticate_user!, only: [:data_fintoc]

  require 'json'

  def data_fintoc
    payload = request.body.read
    event = nil
    link_token = params[:data][:link_token]

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

    # save new event for idempotency
    new_event = WebhookEvent.create!(
      fintoc_event_id: event['id'],
    )
    # Handle the event
    case event['type']
    when 'link.created'
      if link_token
        if fintoc_account.errors.any?
          puts fintoc_account.errors.full_messages
        end
      else
        puts "No link_token in the event"
      end
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
