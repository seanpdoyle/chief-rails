module Locatable
  extend ActiveSupport::Concern

  NEARBY = 5

  included do
    include Geodesic
    acts_as_mappable(
      lat_column_name: :latitude,
      lng_column_name: :longitude,
    )
  end

  module ClassMethods
    def locatable
      where.not(latitude: nil, longitude: nil)
    end

    def near(location, range_in_miles = NEARBY)
      locatable.
        within(range_in_miles, origin: location).
        by_distance(origin: location)
    end
  end
end
