# == Schema Information
#
# Table name: spots
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  slug               :string(255)
#  lat                :float
#  lng                :float
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

class Spot < ActiveRecord::Base
  extend FriendlyId
  extend FriendlyId::Finders

  acts_as_mappable

  ALLOWED_PHOTOS = %w(image/jpeg image/png)

  friendly_id :slug_candidates, use: :slugged

  has_attached_file :photo,
                    processors: [:thumbnail, :location],
                    styles: { large: '600x600#' }

  validates_numericality_of :lat, less_than_or_equal_to: 90.0,
                                  greater_than_or_equal_to: -90.0,
                                  if: :has_location?

  validates_numericality_of :lng, less_than_or_equal_to: 180.0,
                                  greater_than_or_equal_to: -180.0,
                                  if: :has_location?

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  validates_attachment_presence :photo, presence: true
  
  # validates_attachment_size :photo, in: 0..2.megabytes
  validates_attachment_content_type :photo, content_type: ALLOWED_PHOTOS

  scope :near, ->(spot, range_in_miles = 5) {
    location = spot.location
    where.not(id: spot.id).within(range_in_miles, origin: location)
                          .by_distance(origin: location) }

  def nearby(range_in_miles = 5)
    Spot.near(self, range_in_miles)
  end

  def location
    [lat, lng]
  end

  def has_location?
    location.all?(&:present?)
  end

  def slug_candidates
    [
      :name,
      [:id, :name]
    ]
  end
end
