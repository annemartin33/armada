class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.integer :traveler_id
      t.string :arrival_flight
      t.string :departure_flight
      t.string :home_airport
      t.string :destination
      t.integer :trip_id

      t.timestamps
    end
  end
end
