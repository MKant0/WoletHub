class FavoriteRecipientAccount < ApplicationRecord
  belongs_to :user
  belongs_to :recipient_account

  def list_favorites
    favorites = FavoriteRecipientAccount.where(user_id: current_user.id).all
    return favorites
  end
end
