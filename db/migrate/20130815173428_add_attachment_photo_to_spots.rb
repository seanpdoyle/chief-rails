class AddAttachmentPhotoToSpots < ActiveRecord::Migration
  def change
    add_attachment :spots, :photo
  end
end
