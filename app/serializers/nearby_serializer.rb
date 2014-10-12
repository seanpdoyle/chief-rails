class NearbySerializer < ActiveModel::Serializer
  def serializable_hash
    spot_hash.merge distance_hash
  end

  private
  def spot_hash
    SpotSerializer.new(object, options).serializable_hash
  end

  def origin
    options.fetch(meta_key, Nearby.new)
  end

  def distance
    object.distance_to(origin.location)
  end

  def bearing
    bearing = object.bearing_to(origin.location)

    Geocoder::Calculations.compass_point(bearing * -1)
  end

  def distance_hash
    { distance: distance, bearing: bearing }
  end
end
