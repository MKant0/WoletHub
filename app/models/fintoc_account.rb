class FintocAccount < ApplicationRecord
  belongs_to :bank_account
  has_many :movements, dependent: :destroy
  has_one :balance

  def self.fintoc_accounts_index(user, bank)
    FintocAccount.joins(bank_account: :user).where(users: {id:user.id}, bank_account: {id:bank})
  end


end
