class AddNameToBankAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :bank_accounts, :name, :string
  end
end
