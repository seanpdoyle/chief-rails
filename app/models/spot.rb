class Spot < ActiveRecord::Base
  include Locatable

  before_save :locate
  after_touch :locate!

  has_many :images, dependent: :destroy

  validates :name, presence: true
  validates :images, presence: true

  def locatable_images
    images.locatable
  end

  def locate!
    if locate
      save!
    end
    self
  end

  def locate
    if !locatable? && locatable_images.any?
      total = locatable_images.count.to_f
      self.location = [
        locatable_images.map(&:latitude).sum / total,
        locatable_images.map(&:longitude).sum / total,
      ]
    end
    self
  end
end
