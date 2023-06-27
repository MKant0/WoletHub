class Balance < ApplicationRecord
  belongs_to :fintoc_account

  def sumar_balance
    user = current_user
    balances = Balance.where(user_id: user.id).sum
    return balances
  end

end
