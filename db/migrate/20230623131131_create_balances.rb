class CreateBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :balances do |t|
      t.decimal :available
      t.decimal :current
      t.decimal :limit
      t.references :fintoc_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
