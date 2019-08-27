class Itinerary < ApplicationRecord
  # Direct associations

  belongs_to :trip,
             :counter_cache => true

  belongs_to :traveler,
             :counter_cache => true

  # Indirect associations

  # Validations

end
