class FintocAccount < ApplicationRecord
  belongs_to :bank_account
  has_many :movements, dependent: :destroy
  has_one :balance
end
