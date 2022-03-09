class User < ApplicationRecord
  # Direct associations

  has_many   :upcoming_transactions,
             :dependent => :destroy

  has_many   :budgets,
             :dependent => :destroy

  has_many   :transactions,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
