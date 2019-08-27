class Trip < ApplicationRecord
  # Direct associations

  has_many   :itineraries,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
