class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |t|
      t.string    :title
      t.date      :date
      t.decimal   :duration
      t.decimal   :distance
      t.string    :location
      t.string    :intensity
      t.boolean   :drop
      t.integer   :number_of_riders
      t.integer   :elevation_gain
      t.text      :description
      t.string    :image

      t.timestamps
    end
  end
end
