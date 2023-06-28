class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home

  end

  def dashboard
    @bank_accounts = BankAccount.all
    @balances = Balance.sumar_balance(current_user)
    # @recent = Movement.recent_transactions(current_user)
    # @favorites = FavoriteRecipientAccount.list_favorites
  end

end
