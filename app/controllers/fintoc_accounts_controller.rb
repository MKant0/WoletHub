class FintocAccountsController < ApplicationController

  require_relative '../services/fintoc_services.rb'
  def new
    @fintoc_account = FintocAccount.new
    # @link_intent = create_link_intent
  end


  def create
    @fintoc_account = FintocAccount.new(fintoc_account_params)

    if @fintoc_account.save
      # La vinculación bancaria se creó correctamente
      redirect_to fintoc_account_path(@fintoc_account)
    else
      # Hubo un error al crear la vinculación bancaria
      render :new
    end
  end


  def show
    @fintoc_account = FintocAccount.find(params[:id])
    @bank_account = BankAccount.find(params[:id])
    @movements = Movement.all_movements(current_user, @fintoc_account)
    @sidebar = true
    @fintoc_access = FintocService.get_account_info(ENV['FINTOC_LINK_TOKEN'], ENV['FINTOC_API_KEY'])
    @account_id = @fintoc_access[0].id
    
  end
end
