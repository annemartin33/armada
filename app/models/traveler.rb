class Traveler < ApplicationRecord
  # Direct associations

  has_many   :itineraries,
             :dependent => :destroy

  # Indirect associations

  has_many   :expenses,
             :through => :trips,
             :source => :expenses

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
