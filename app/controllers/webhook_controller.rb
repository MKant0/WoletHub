class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:data_fintoc]
  skip_before_action :authenticate_user!, only: [:data_fintoc]

  def data_fintoc
    event = JSON.parse(request.body.read)
    link_token = event.dig('data', 'link_token')

    if WebhookEvent.exists?(fintoc_event_id: event['id'])
      render json: { message: 'Event already processed' }, status: 200
      return
    end

    WebhookEvent.create!(fintoc_event_id: event['id'])

    case event['type']
    when 'link.created'
      handle_link_created(link_token) if link_token
    when 'link.credentials_changed'
      handle_link_credentials_changed(event['data']['id'])
    when 'link.refresh_intent.succeeded'
      handle_link_refresh_intent_succeeded(event['data']['refreshed_object_id'])
    when 'account.refresh_intent.succeeded'
      handle_account_refresh_intent_succeeded(event['data']['refreshed_object_id'])
    else
      puts "Unhandled event type: #{event['type']}"
    end

    render json: { message: 'Webhook received' }, status: 200
  end

  private

  def handle_link_created(link_token)
    # Define your logic for handling a link.created event here.
    # For example, you might want to create a new FintocAccount:
    fintoc_account = FintocAccount.new(link_token: link_token)
    if fintoc_account.save
      puts "FintocAccount created successfully"
    else
      puts fintoc_account.errors.full_messages
    end
  end

  def handle_link_credentials_changed(link_id)
    # Define your logic for handling a link.credentials_changed event here.
  end

  def handle_link_refresh_intent_succeeded(link_id)
    # Define your logic for handling a link.refresh_intent.succeeded event here.
  end

  def handle_account_refresh_intent_succeeded(account_id)
    # Define your logic for handling an account.refresh_intent.succeeded event here.
  end
end
