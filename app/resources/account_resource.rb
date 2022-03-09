class AccountResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :account_type, :string
  attribute :balance, :string

  # Direct associations

  # Indirect associations

end
