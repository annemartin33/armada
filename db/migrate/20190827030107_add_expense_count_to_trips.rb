class AddExpenseCountToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :expenses_count, :integer
  end
end
