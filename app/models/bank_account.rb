class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :fintoc_accounts, dependent: :destroy

  validates :user, presence: true

  def dropdown_banks(user)
    banks = BankAccount.joins(fintoc_account: {bank_account: :user}).where(users: {id:user.id}).all
    banks
  end
end
