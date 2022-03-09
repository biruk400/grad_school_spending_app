class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.string :balance

      t.timestamps
    end
  end
end
