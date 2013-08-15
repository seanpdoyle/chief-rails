class AddAttachmentPhotoToSpots < ActiveRecord::Migration
  def self.up
    change_table :spots do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :spots, :photo
  end
end
