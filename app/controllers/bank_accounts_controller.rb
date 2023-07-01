class BankAccountsController < ApplicationController
  require 'open-uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  def index
    @bank_accounts = BankAccount.all
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end

  def index_fintoc_account
    @fintoc_account = FintocAccount.all
  end

end
