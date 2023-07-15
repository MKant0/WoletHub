class TransactionsController < ApplicationController

  def index
    @movements = Movement.all_transactions(current_user)
    @sidebar = true
    @movements = Movement.order(created_at: :desc).page params[:page]
  end

  # def show
    # @transaction = Transactions.find(params[:id])
  # end
end
