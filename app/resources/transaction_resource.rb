class TransactionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :amount, :integer
  attribute :category_id, :integer
  attribute :transaction_date, :date
  attribute :account_id, :integer
  attribute :event, :string

  # Direct associations

  belongs_to :category

  belongs_to :user

  # Indirect associations

end
