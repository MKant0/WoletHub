class TransactionsController < ApplicationController

  def index
    @movements = Movement.all_transactions(current_user)
    @sidebar = true
    @movements = Movement.order(created_at: :desc).page params[:page]
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
