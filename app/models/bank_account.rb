class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :fintoc_accounts, dependent: :destroy

  validates :user, presence: true
end
