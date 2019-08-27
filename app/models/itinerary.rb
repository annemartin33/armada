class Itinerary < ApplicationRecord
  # Direct associations

  belongs_to :traveler,
             :counter_cache => true

  # Indirect associations

  # Validations

end
