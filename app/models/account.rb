class Account < ApplicationRecord
  # Direct associations

  has_many   :transactions,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    account_type
  end

end
