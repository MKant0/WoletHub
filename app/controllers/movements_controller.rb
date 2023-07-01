class MovementsController < ApplicationController

  def new
    @movement = Movement.new
    @bank = BankAccount.show_all_banks(current_user)
  end

  def create
    @movement = Movement.new(movement_params)
    @movement.bank_account = BankAccount.find(params[:bank_account_id].to_i)
    if @movement.save
      redirect_to movement_confirmation_path(@movement) # agregar ruta de la confirmacion
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @movement = Movement.find(params[:id])
  end

  def movement_confirmation
    redirect_to # pagina de confirmacion
  end

  def index_movements
    @movements = FintocService.get_movements(account_id, link_token, api_key)
    # Ahora puedes usar @movements en tu vista para mostrar los movimientos de la cuenta
  end

  def show
    @movement = Movement.find(params[:id])
    @movement_details = FintocService.get_movement_details(@movement.account_id, @movement.id, link_token, api_key)
    # Aquí, link_token y api_key serían los valores relevantes para el usuario actual.
  end

  private

  def movement_params
    params.require(:movement).permit(:fintoc_account_id, :fintoc_account, :bank_account_id, :bank_account, :amount)
  end
end
