class Expense < ApplicationRecord
  # Direct associations

  belongs_to :trip,
             :counter_cache => true

  # Indirect associations

  # Validations

end
