class WebhookController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:data_fintoc]
  skip_before_action :authenticate_user!, only: [:data_fintoc]

  require 'json'

  def data_fintoc
    data = JSON.parse(request.body.read)
    link_id = data["data"]["id"]
    token = FintocServices.link_token(link_id)

    if token == "wrong_link_id"
      render json: { error: "El link id es incorrecto." }, status: 400
      return
    end

    holder_id = data["data"]["holder_id"]
    holder_name = data["data"]["holder_name"]
    accounts = data["data"]["accounts"]

    accounts.each do |account|
      fintoc_account = FintocAccount.create(
        holder_id: holder_id,
        holder_name: holder_name,
        fintoc_token: token,
        name: account["name"],
        currency: account["currency"],
        number: account["number"],
        account_type: account["type"],
        official_name: account["official_name"],
        refreshed_at: account["refreshed_at"]
      )
      unless fintoc_account.persisted?
        render json: { error: "No se pudo crear la cuenta Fintoc." }, status: 400
        return
      end
      puts FintocAccount.last
    end

    render json: {}, status: 200
  end
end
