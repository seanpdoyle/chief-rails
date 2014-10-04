class Image < ActiveRecord::Base
  include Locatable

  belongs_to :spot

  has_attached_file :file, processors: [:thumbnail, :location],
    styles: { thumbnail: "300x300#", large: "1000x1000>" }
  process_in_background :file

  validates_attachment :file,
    presence: true,
    content_type: { content_type: %r{\Aimage/.*\Z} }

  def self.orphan
    where(spot_id: nil)
  end

  def url
    file.url
  end
end
