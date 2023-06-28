class Movement < ApplicationRecord
  belongs_to :fintoc_account
  belongs_to :recipient_account

  # def self.recent_transactions(user)
  #   recent = []
  #   user.bank_accounts.each do |bank_account|
  #     fintoc_accounts = bank_account.fintoc_account
  #     fintoc_accounts.each do |fintoc_account|
  #       recent << fintoc_account.movements
  #     end
  #   end
  #   recent.last(3)
  #   # Movement.where(user_id: user.id).last(3)
  #   # return recent
  # end

end
