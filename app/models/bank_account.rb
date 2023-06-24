class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :banks, dependent: :destroy

  validates :name, :email, :password, :bank, :prefered_currency, presence: true
end
