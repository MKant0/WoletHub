class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      redirect_to dashboard_path
    else
      @sidebar = false
      @navbar = true
    end
  end

  def dashboard
    @bank_accounts = BankAccount.show_all_banks(current_user)
    @balances_data = {}  # Store the balances data

    @bank_accounts.each do |account|
      balance = Balance.find_by(fintoc_account_id: account.fintoc_accounts.pluck(:id))
      @balances_data[account.name] = balance.available if balance.present?
    end
    @banks = BankAccount.show_all_banks(current_user)
    @recent = Movement.recent_transactions(current_user)
    @favorites = FavoriteRecipientAccount.where(user_id: current_user.id).includes(:recipient_account)
    @sidebar = true
    @navbar = false
  end

  def _sidebar
    @banks = BankAccount.show_all_banks(current_user)
  end
end
