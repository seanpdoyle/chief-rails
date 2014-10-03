module Locatable
  extend ActiveSupport::Concern

  NEARBY = 5

  included do
    acts_as_mappable(
      lat_column_name: :latitude,
      lng_column_name: :longitude,
    )

    alias_attribute :lat, :latitude
    alias_attribute :lng, :longitude

    validates :latitude,
      numericality: {
      less_than_or_equal_to: 90.0,
      greater_than_or_equal_to: -90.0,
      allow_nil: true,
    }

    validates :longitude,
      numericality: {
      less_than_or_equal_to: 180.0,
      greater_than_or_equal_to: -180.0,
      allow_nil: true,
    }

    def location
      [ latitude, longitude ]
    end
  end

  module ClassMethods
    def near(location, range_in_miles = NEARBY)
      locatable.
        within(range_in_miles, origin: location).
        by_distance(origin: location)
    end

    def locatable
      where.not(latitude: nil, longitude: nil)
    end
  end
end
