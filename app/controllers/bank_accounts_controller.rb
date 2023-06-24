class BankAccountsController < ApplicationController

  def index
    @bank_accounts = BankAccount.all
  end
end
