class AddUserReferenceToUpcomingTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :upcoming_transactions, :users
    add_index :upcoming_transactions, :user_id
    change_column_null :upcoming_transactions, :user_id, false
  end
end
