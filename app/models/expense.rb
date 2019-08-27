class Expense < ApplicationRecord
  # Direct associations

  belongs_to :trip,
             :counter_cache => true

  # Indirect associations

  has_one    :participant,
             :through => :trip,
             :source => :participants

  # Validations

end
