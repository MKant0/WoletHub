class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :fintoc_accounts, dependent: :destroy
  has_many :movements, through: :fintoc_accounts

  validates :user, presence: true

  def self.show_all_banks(user)
    banks = BankAccount.joins(:user).where(users: {id:user.id})
    banks
  end

end
