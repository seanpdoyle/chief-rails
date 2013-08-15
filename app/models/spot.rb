class Spot < ActiveRecord::Base
  extend FriendlyId
  extend FriendlyId::Finders

  ALLOWED_PHOTOS = %w(image/jpg image/png)

  friendly_id :slug_candidates, use: :slugged

  has_attached_file :photo, styles: { large: '600x600#' }

  validates_numericality_of :lat, less_than_or_equal_to: 90.0,
                                  greater_than_or_equal_to: -90.0

  validates_numericality_of :lng, less_than_or_equal_to: 180.0,
                                  greater_than_or_equal_to: -180.0

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  validates :photo, attachment_presence: true
  
  # validates_attachment_size :photo, in: 0..2.megabytes
  validates_attachment_content_type :photo, content_type: ALLOWED_PHOTOS

  def slug_candidates
    [
      :name,
      [:id, :name]
    ]
  end
end