class AddCategoryReferenceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :transactions, :categories
    add_index :transactions, :category_id
    change_column_null :transactions, :category_id, false
  end
end
