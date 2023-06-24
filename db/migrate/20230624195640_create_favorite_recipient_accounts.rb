class CreateFavoriteRecipientAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_recipient_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipient_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
