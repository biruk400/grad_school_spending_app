class AddUserReferenceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transactions, :users
    add_index :transactions, :user_id
    change_column_null :transactions, :user_id, false
  end
end
