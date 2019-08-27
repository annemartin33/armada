require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:trip) }

    it { should belong_to(:traveler) }

    end

    describe "InDirect Associations" do

    it { should have_one(:trip_destination) }

    end

    describe "Validations" do
      
    end
end
