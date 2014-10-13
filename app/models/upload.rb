class Upload
  include ActiveModel::Model

  attr_accessor :url

  validates :url, presence: true, url: true

  def save
    if valid?
      Delayed::Job.enqueue(self)
    end
  end

  def perform
    Image.create(file: url)
  end
end
