class UploadSerializer < ActiveModel::Serializer
  attributes :id, :url

  def id
    object.job.id
  end
end
