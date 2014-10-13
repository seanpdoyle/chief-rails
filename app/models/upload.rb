class Upload
  include ActiveModel::Model
  include ActiveModel::SerializerSupport

  attr_accessor :job, :url

  validates :url, presence: true, url: true

  def save
    if valid?
      self.job = Delayed::Job.enqueue(self)
      true
    end
  end

  def perform
    Image.create(file: url)
  end
end
