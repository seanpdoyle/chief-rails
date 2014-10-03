class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name, null: false

      t.decimal :latitude, precision: 15, scale: 2
      t.decimal :longitude, precision: 15, scale: 2

      t.timestamps
    end
  end
end
