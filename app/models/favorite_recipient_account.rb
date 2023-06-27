class FavoriteRecipientAccount < ApplicationRecord
  belongs_to :user
  belongs_to :recipient_account
end
