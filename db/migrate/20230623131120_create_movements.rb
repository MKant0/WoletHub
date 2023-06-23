class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.references :fintoc_account, null: false, foreign_key: true
      t.string :currency
      t.decimal :amount
      t.string :description
      t.date :transaction_date
      t.string :reference_id
      t.string :type
      t.boolean :pending
      t.references :recipient_account, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
