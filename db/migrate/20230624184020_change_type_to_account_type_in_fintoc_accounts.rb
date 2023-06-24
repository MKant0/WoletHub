class ChangeTypeToAccountTypeInFintocAccounts < ActiveRecord::Migration[7.0]
  def change
    rename_column :fintoc_accounts, :type, :account_type
  end
end
