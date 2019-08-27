require 'rails_helper'

RSpec.describe Expense, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:trip) }

    end

    describe "InDirect Associations" do

    it { should have_one(:participant) }

    end

    describe "Validations" do
      
    end
end
