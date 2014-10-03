class ImageSerializer < ActiveModel::Serializer
  attributes :id, :latitude, :longitude, :spot_id, :original, :large, :thumbnail

  def original
    full_url_for(object.file.url(:original))
  end

  def thumbnail
    full_url_for(object.file.url(:thumbnail))
  end

  def large
    full_url_for(object.file.url(:large))
  end

  private

  def full_url_for(image)
    Rails.configuration.asset_host.to_s + image
  end
end
