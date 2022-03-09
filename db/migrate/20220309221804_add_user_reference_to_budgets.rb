class AddUserReferenceToBudgets < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :budgets, :users
    add_index :budgets, :user_id
    change_column_null :budgets, :user_id, false
  end
end
