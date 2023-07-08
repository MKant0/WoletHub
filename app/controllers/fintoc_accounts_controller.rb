class FintocAccountsController < ApplicationController
  def new
    @fintoc_account = FintocAccount.new
    @link_intent = create_link_intent
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
  end

  private

  def create_link_intent
    api_key = ENV['FINTOC_API_KEY']
    fintoc_client = Fintoc::Client.new(api_key)

    link_intent = fintoc_client.create_link_intent(
      country: 'cl',
      holder_type: 'individual',
      product: 'movements',
      mode: 'live'
    )

    link_intent.to_h
  end
end
