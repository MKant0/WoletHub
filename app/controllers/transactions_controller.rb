class TransactionsController < ApplicationController

  def index
    @sidebar = true
    if params[:query].present?
      @movements = Movement.search_movements(params[:query])
    else
      # @movements = Movement.order(created_at: :desc).page params[:page]
      @movements = Movement.all_transactions(current_user)
    end

    respond_to do |format|
      format.xlsx {
        response.headers[
          'Content-Disposition'
        ] = "attachment; filename='transacciones.xlsx'"
      }
      format.html { render :index }
    end


  end

  # def show
    # @transaction = Transactions.find(params[:id])
  # end
end
