class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :name, default: "", null: false
      t.float :lat
      t.float :lng

      t.timestamps
    end

    add_index :spots, :name, unique: true
  end
end
