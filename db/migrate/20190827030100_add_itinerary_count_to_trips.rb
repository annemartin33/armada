class AddItineraryCountToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :itineraries_count, :integer
  end
end
