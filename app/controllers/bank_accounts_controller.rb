class BankAccountsController < ApplicationController
  require 'open-uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  def index
    @banks = BankAccount.show_all_banks(current_user)
    @sidebar = true
  end


  def show
    @bank_account = BankAccount.find(params[:id])
    @fintoc_account = FintocAccount.fintoc_accounts_index(current_user, @bank_account)
    @sidebar = true
  end
end
