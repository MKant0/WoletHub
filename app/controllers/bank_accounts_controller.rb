class BankAccountsController < ApplicationController
  require 'open-uri'
  require 'net/http'
  require 'openssl'
  require 'json'

  def index
    @banks = BankAccount.show_all_banks(current_user)
    @sidebar = true
    @fintoc_account = FintocAccount.fintoc_accounts_index(current_user, @bank_account)
  end


  def show
    @bank_account = BankAccount.find(params[:id])
    @fintoc_account = FintocAccount.fintoc_accounts_index(current_user, @bank_account)
    @sidebar = true
    respond_to do |format|
      format.html
      format.text { render partial: "fintoc_partial", locals: { fintoc_account: @fintoc_account }, formats: [:html] }
    end
  end

end
