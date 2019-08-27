class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :destination
      t.string :trip_name
      t.integer :traveler_id

      t.timestamps
    end
  end
end
