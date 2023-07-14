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

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)
    if @bank_account.save
      redirect_to bank_account_path(@bank_account)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(:name)
  end
end
