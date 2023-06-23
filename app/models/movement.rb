class Movement < ApplicationRecord
  belongs_to :fintoc_account
  belongs_to :recipient_account
end
