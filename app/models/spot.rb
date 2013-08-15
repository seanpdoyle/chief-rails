class Spot < ActiveRecord::Base
  extend FriendlyId
  extend FriendlyId::Finders

  friendly_id :slug_candidates, use: :slugged

  validates_presence_of :name, :slug
  validates_uniqueness_of :name, :slug

  validates_numericality_of :lat, less_than_or_equal_to: 90.0,
                                  greater_than_or_equal_to: -90.0

  validates_numericality_of :lng, less_than_or_equal_to: 180.0,
                                  greater_than_or_equal_to: -180.0

  has_attached_file :photo

  def slug_candidates
    [
      :name,
      [:id, :name]
    ]
  end
end