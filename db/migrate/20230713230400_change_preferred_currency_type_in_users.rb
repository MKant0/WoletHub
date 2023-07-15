class ChangePreferredCurrencyTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :preferred_currency, :string
  end
end
