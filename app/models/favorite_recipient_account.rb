class FavoriteRecipientAccount < ApplicationRecord
  belongs_to :user
  belongs_to :recipient_account

  def self.list_favorites(user)

    favorites = FavoriteRecipientAccount.where(user_id: user.id).all
    return favorites
  end
end
