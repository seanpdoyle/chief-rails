class ImageSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :spot_id, :url
end
