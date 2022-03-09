class AddAccountReferenceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transactions, :accounts
    add_index :transactions, :account_id
    change_column_null :transactions, :account_id, false
  end
end
