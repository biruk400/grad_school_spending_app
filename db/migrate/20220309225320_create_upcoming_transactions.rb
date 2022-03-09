class CreateUpcomingTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :upcoming_transactions do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
