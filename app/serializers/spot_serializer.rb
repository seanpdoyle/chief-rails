class SpotSerializer < ActiveModel::Serializer
  cached

  delegate :cache_key, to: :object

  attributes :id, :name, :lat, :lng, :photos

  def photos
    %w[small medium large].each_with_object({}) do |key, hash|
      hash[key] = object.photo.url(key)
    end
  end
end
