class FintocAccountsController < ApplicationController

  require_relative '../services/fintoc_services.rb'


  def index
    bank_account = BankAccount.find(params[:bank_account_id])
    fintoc_accounts = FintocAccount.where(bank_account_id: bank_account.id)

    render json: fintoc_accounts
  end

  def new
    @bank_account_id = params[:bank_account_id]
    @fintoc_account = FintocAccount.new
    session[:bank_account_id] = @bank_account_id
  end

  def create
    @fintoc_data = FintocServices.get_account_info(link_token, ENV['FINTOC_API_KEY'])
    @fintoc_account = FintocAccount.new(fintoc_account_params)
    @fintoc_account.bank_account = BankAccount.find(session[:bank_account_id]) # Asegúrate de que la sesión tenga el bank_account_id correcto
    if @fintoc_account.save
      render json: { id: @fintoc_account.id }
    else
      render json: { error: 'There was an error creating the fintoc account.' }, status: :unprocessable_entity
    end
  end

  def show
    @fintoc_account = FintocAccount.find(params[:id])
    @bank_account = BankAccount.find(@fintoc_account.bank_account_id)
    @movements = Movement.where(fintoc_account_id: @fintoc_account.id)
    @movements = @movements.order('transaction_date DESC')
    # @movements = Movement.all_movements(current_user, @fintoc_account)
    @sidebar = true
    # @fintoc_access = FintocService.get_account_info(link_token, ENV['FINTOC_API_KEY'])
    # @account_id = @fintoc_access[0].id
    # @fintoc_movement = FintocService.get_movements(@account_id, link_token, ENV['FINTOC_API_KEY'])
  end

  private

  def fintoc_account_params
    params.require(:fintoc_account).permit(:name, :amount, :currency, :number, :account_type, :widget_token, :official_name, :holder_id, :holder_name, :refreshed_at)
  end
end
