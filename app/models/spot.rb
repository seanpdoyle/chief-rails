class Spot < ActiveRecord::Base
  extend FriendlyId
  extend FriendlyId::Finders

  friendly_id :slug_candidates, use: :slugged

  validates_presence_of :name
  validates_uniqueness_of :name, :slug

  def slug_candidates
    [
      :name,
      [:id, :name]
    ]
  end
end