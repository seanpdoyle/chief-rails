class Spot < ActiveRecord::Base
  include Locatable

  after_create :locate

  has_many :images, dependent: :destroy

  validates :name, presence: true

  def locatable_images
    images.locatable
  end

  def locate
    if !locatable? && locatable_images.any?
      total = locatable_images.count.to_f
      self.location = [
        locatable_images.map(&:latitude).sum / total,
        locatable_images.map(&:longitude).sum / total,
      ]
    end
  end
end
