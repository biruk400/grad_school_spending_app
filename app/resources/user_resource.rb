class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false

  # Direct associations

  has_many   :upcoming_transactions

  has_many   :budgets

  has_many   :transactions

  # Indirect associations
end
