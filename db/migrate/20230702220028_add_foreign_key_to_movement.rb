class AddForeignKeyToMovement < ActiveRecord::Migration[7.0]
  def change
    add_reference :movements, :bank_account, foreign_key: true
  end
end
