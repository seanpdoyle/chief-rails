class Image < ActiveRecord::Base
  include Locatable

  belongs_to :spot

  has_attached_file :file, processors: [:thumbnail, :location]

  validates_attachment :file,
    presence: true,
    content_type: { content_type: %r{\Aimage/.*\Z} }

  def url
    file.url
  end
end
