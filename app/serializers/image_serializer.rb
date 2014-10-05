class ImageSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :spot_id, :original, :large, :thumbnail

  def original
    object.file.url(:original)
  end

  def thumbnail
    object.file.url(:thumbnail)
  end

  def large
    object.file.url(:large)
  end
end
