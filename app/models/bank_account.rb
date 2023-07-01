class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :fintoc_accounts, dependent: :destroy

  validates :user, presence: true

  def self.show_all_banks(user)
    banks = BankAccount.joins(fintoc_accounts: {bank_account: :user}).where(users: {id:user.id}).all
    banks
  end

end
