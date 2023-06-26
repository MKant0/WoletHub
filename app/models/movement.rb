class Movement < ApplicationRecord
  belongs_to :fintoc_account
  belongs_to :recipient_account

  def recent_transactions
    recent = []
    recent.push(Movement.where(user_id: current_user.id).last(3))
    return recent
  end

end
