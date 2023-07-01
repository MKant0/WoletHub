class MovementsController < ApplicationController

  def new
    @movements = Movement.new
  end

  def create
  end

  def movement_confirmation
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
end
