class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.float :lat
      t.float :lng

      t.timestamps
    end

    add_index :spots, :name, unique: true
    add_index :spots, :slug, unique: true
  end
end
