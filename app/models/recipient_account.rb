class RecipientAccount < ApplicationRecord
  has_many :favorite_recipient_accounts
  has_many :users, through: :favorite_recipient_accounts
end
