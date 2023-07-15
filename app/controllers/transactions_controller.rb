class TransactionsController < ApplicationController

  def index
    @movements = Movement.all_transactions(current_user)
    @sidebar = true
  end

  # def show
    # @transaction = Transactions.find(params[:id])
  # end
end
