class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :amount

      t.timestamps
    end
  end
end
