class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude

  has_many :images

  embed :ids, include: true
end
