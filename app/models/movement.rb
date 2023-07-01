class Movement < ApplicationRecord
  belongs_to :fintoc_account
  belongs_to :recipient_account

  validates :bank, :amount, :person, presence: true

  def self.recent_transactions(user)
    # recent = []
    # user.bank_accounts.each do |bank_account|
    #   fintoc_accounts = bank_account.fintoc_account
    #   fintoc_accounts.each do |fintoc_account|
    #     recent << fintoc_account.movements
    #   end
    # end
    # recent.last(3)
    # # Movement.where(user_id: user.id).last(3)
    # # return recent
    recent = Movement.joins(fintoc_account: {bank_account: :user}).where(users: {id:user.id}).first(3)
    recent
  end

end
