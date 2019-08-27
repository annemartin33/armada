class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.integer :trip_id
      t.string :expense_name

      t.timestamps
    end
  end
end
