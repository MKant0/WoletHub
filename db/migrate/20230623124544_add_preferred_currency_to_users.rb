class AddPreferredCurrencyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :preferred_currency, :integer
  end
end
