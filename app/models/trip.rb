class Trip < ApplicationRecord
  # Direct associations

  has_many   :expenses

  has_many   :itineraries,
             :dependent => :destroy

  # Indirect associations

  has_many   :participants,
             :through => :itineraries,
             :source => :traveler

  has_many   :participant_itineraries,
             :through => :participants,
             :source => :itineraries

  # Validations

end
