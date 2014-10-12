module Locatable
  extend ActiveSupport::Concern

  NEARBY = 5

  included do
    include Geodesic

    reverse_geocoded_by :latitude, :longitude
  end

  module ClassMethods
    def locatable
      geocoded
    end
  end
end
