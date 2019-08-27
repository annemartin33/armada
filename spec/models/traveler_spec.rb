require 'rails_helper'

RSpec.describe Traveler, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:itineraries) }

    end

    describe "InDirect Associations" do

    it { should have_many(:trips) }

    it { should have_many(:expenses) }

    end

    describe "Validations" do
      
    end
end
