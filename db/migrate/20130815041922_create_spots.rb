class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots, id: :uuid do |t|
      t.string :name
      t.string :slug
      t.float :lat
      t.float :lng
      t.boolean :photo_processing, default: false, null: false
      t.boolean :location_locked, default: false, null: false

      t.timestamps
    end

    add_attachment :spots, :photo

    add_index :spots, :name, unique: true
    add_index :spots, :slug, unique: true
  end
end
