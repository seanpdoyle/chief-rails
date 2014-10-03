class Spot < ActiveRecord::Base
  include Locatable

  has_many :images, dependent: :destroy

  validates :name, presence: true
end
