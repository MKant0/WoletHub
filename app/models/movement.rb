class Movement < ApplicationRecord
  belongs_to :fintoc_account
  belongs_to :recipient_account
  belongs_to :bank_account

  validates :bank_account, :fintoc_account, :amount, :recipient_account, presence: true

  paginates_per 10
  # forgein_key :

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
    recent = Movement.joins(fintoc_account: { bank_account: :user }).where(users: { id: user.id }).order('transaction_date DESC').first(3)
    recent
  end

  def self.all_movements(user, fintoc)
    all = Movement.joins(fintoc_account: { bank_account: :user }).where(users: { id: user.id }, fintoc_account: { id:fintoc.id })
    all.reverse()
  end

  def self.all_transactions(user)
    all = Movement.joins(fintoc_account: { bank_account: :user }).where(users: { id: user.id })
    all.reverse()
  end

  include PgSearch::Model
  pg_search_scope :search_movements,
  against: [ :amount, :description, :transaction_date ],
  using: {
    tsearch: { prefix: true }
  }
end
