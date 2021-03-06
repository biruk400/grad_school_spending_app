class Transaction < ApplicationRecord
  # Direct associations

  belongs_to :account

  belongs_to :category

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
