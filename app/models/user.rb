class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bank_accounts
  has_many :favorite_recipient_accounts
  has_many :recipient_accounts, through: :favorite_recipient_accounts
  has_many :fintoc_accounts, through: :bank_accounts
end
