class WebhookController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:data_fintoc]
  skip_before_action :authenticate_user!, only: [:data_fintoc]

  require 'json'

  def data_fintoc
    data = JSON.parse(request.body.read)
    link_id = data["data"]["id"]
    link_token = data["data"]["link_token"] # obteniendo el link_token directamente de los datos del webhook

    if data["type"] == "link.created"
      link_id = data["data"]["id"]
      accounts = data["data"]["accounts"]
      accounts.each do |account|
        FintocAccount.create(
          name: account["name"],
          number: account["number"],
          account_type: account["type"],
          widget_token: link_token,
          official_name: account["official_name"],
          holder_id: account["holder_id"],
          holder_name: account["holder_name"],
          refreshed_at: account["refreshed_at"]
        )
      end
      render json: { message: "account created successfully" }, status: :ok
    else
      render json: { message: "invalid data" }, status: :bad_request
    end
  end
end
