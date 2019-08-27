class AddItineraryCountToTravelers < ActiveRecord::Migration[5.1]
  def change
    add_column :travelers, :itineraries_count, :integer
  end
end
