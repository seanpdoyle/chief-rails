class Nearby
  include ActiveModel::SerializerSupport
  include ActiveModel::Model
  include Geodesic

  DEFAULT_RADIUS = 5.0

  attr_accessor :latitude, :longitude, :radius

  validates :latitude, presence: true
  validates :longitude, presence: true

  def radius
    @radius || DEFAULT_RADIUS
  end

  def origin
    location
  end

  def latitude=(latitude)
    @latitude = if latitude.nil?
                  nil
                else
                  latitude.to_f
                end
  end

  def longitude=(longitude)
    @longitude = if longitude.nil?
                  nil
                else
                  longitude.to_f
                end
  end

  def radius=(radius)
    @radius = if radius.nil?
                  nil
                else
                  radius.to_f
                end
  end

  def spots
    Spot.near(location, radius)
  end
end
