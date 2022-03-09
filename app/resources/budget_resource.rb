class BudgetResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :category_id, :integer
  attribute :amount, :string

  # Direct associations

  belongs_to :user

  # Indirect associations
end
