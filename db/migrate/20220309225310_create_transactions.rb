class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :amount
      t.integer :category_id
      t.date :transaction_date
      t.integer :account_id
      t.string :event

      t.timestamps
    end
  end
end
