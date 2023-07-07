class Balance < ApplicationRecord
  belongs_to :fintoc_account

  def self.sumar_balance(user)
    # balances = []
    # user.bank_accounts.each do |bank_account|
    #   fintoc_accounts = bank_account.fintoc_account
    #     fintoc_accounts.each do |fintoc_account|
    #       balances << fintoc_account.balance
    #     end
    # end
    # balances

    balances = Balance.joins(fintoc_account: {bank_account: :user}).where(users: {id:user.id})
    balances.pluck(:available).sum
  end



end
