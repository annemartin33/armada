require 'rails_helper'

RSpec.describe Trip, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:expenses) }

    it { should have_many(:itineraries) }

    end

    describe "InDirect Associations" do

    it { should have_many(:participants) }

    it { should have_many(:participant_itineraries) }

    end

    describe "Validations" do
      
    end
end
