class CreateRecipientAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :recipient_accounts do |t|
      t.string :holder_id
      t.string :holder_name
      t.string :number
      t.string :institution

      t.timestamps
    end
  end
end
