class FintocAccount < ApplicationRecord
  belongs_to :bank_account
  has_many :movements, dependent: :destroy
end
