module Geodesic
  extend ActiveSupport::Concern

  included do
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

    def locatable?
      latitude.present? && longitude.present?
    end

    def location=(location)
      self.latitude, self.longitude, _ = *location
    end

    def location
      [ latitude, longitude ]
    end
  end
end
