class CreateRidesAndRiders < ActiveRecord::Migration[5.1]
  def change
    create_table :rides_and_riders, id: false do |t|
      t.belongs_to :ride, index: true
      t.belongs_to :user, index: true
    end

    add_index :rides_and_riders, [:ride_id, :user_id], unique: true
  end
end
