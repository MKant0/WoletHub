class ChangeAmountToStringInMovements < ActiveRecord::Migration[7.0]
  def change
    change_column :movements, :amount, :string
  end
end
