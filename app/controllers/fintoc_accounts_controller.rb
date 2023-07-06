class FintocAccountsController < ApplicationController

  def create

  end

  def show
    @fintoc_account = FintocAccount.find(params[:id])
    @bank_account = BankAccount.find(params[:id])
    @movements = Movement.all_movements(current_user, @fintoc_account)
    @sidebar = true
  end

end
