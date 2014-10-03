class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :file

      t.belongs_to :spot, index: true

      t.decimal :latitude, precision: 15, scale: 10
      t.decimal :longitude, precision: 15, scale: 10

      t.timestamps null: false
    end
  end
end
