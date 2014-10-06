class Spot < ActiveRecord::Base
  include Locatable

  before_validation :locate

  has_many :images, dependent: :destroy

  validates :images, presence: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

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

  private

  def locatable_images
    if persisted?
      images.locatable
    else
      images.select(&:locatable?)
    end
  end
end
