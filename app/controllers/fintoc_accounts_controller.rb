class FintocAccountsController < ApplicationController

  require_relative '../services/fintoc_services.rb'

  def index
    bank_account = BankAccount.find(params[:bank_account_id])
    fintoc_accounts = FintocAccount.fintoc_accounts_index(current_user, bank_account)

    render json: fintoc_accounts
  end

  def new
    @bank_account_id = params[:bank_account_id]
    @fintoc_account = FintocAccount.new
  end



  def create
    @fintoc_account = FintocAccount.new(fintoc_account_params)

    if @fintoc_account.save
      render json: { id: @fintoc_account.id }
    else
      render json: { error: 'There was an error creating the fintoc account.' }, status: :unprocessable_entity
    end
  end

  def show
    @fintoc_account = FintocAccount.find(params[:id])
    @bank_account = BankAccount.find(params[:id])
    @movements = Movement.all_movements(current_user, @fintoc_account)
    @sidebar = true
    @fintoc_access = FintocService.get_account_info(ENV['FINTOC_LINK_TOKEN'], ENV['FINTOC_API_KEY'])
    @account_id = @fintoc_access[0].id
    @fintoc_movement = FintocService.get_movements(@account_id, ENV['FINTOC_LINK_TOKEN'], ENV['FINTOC_API_KEY'])
  end

end
