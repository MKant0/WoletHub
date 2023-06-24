class CreateFintocAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :fintoc_accounts do |t|
      t.references :bank_account, null: false, foreign_key: true
      t.string :name
      t.decimal :amount
      t.string :currency
      t.integer :number
      t.string :type
      t.text :widget_token
      t.string :official_name
      t.string :holder_id
      t.string :holder_name
      t.datetime :refreshed_at

      t.timestamps
    end
  end
end
