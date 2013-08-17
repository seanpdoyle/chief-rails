class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name
      t.string :slug
      t.float :lat
      t.float :lng
      t.boolean :photo_processing

      t.timestamps
    end

    add_attachment :spots, :photo

    add_index :spots, :name, unique: true
    add_index :spots, :slug, unique: true
  end
end
