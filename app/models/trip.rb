class Trip < ApplicationRecord
  # Direct associations

  has_many   :expenses

  has_many   :itineraries,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
