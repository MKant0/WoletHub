class Movement < ApplicationRecord
  belongs_to :fintoc_account
  belongs_to :recipient_account
  has_one :bank_account, through: :fintoc_account

  validates :bank_account, :amount, presence: true
  #forgein_key :

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

  def self.all_movements(user, fintoc)
    Movement.joins(fintoc_account: {bank_account: :user}).where(users: {id:user.id}, fintoc_account: {id:fintoc.id})
  end

end
