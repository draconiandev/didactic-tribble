#
class Destination < ActiveRecord::Base
  has_many :activities, dependent: :destroy

  validates :name, :description, :brief, :slug, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  mount_uploader :cover, CoverUploader

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def slug_candidates
    [
      :slug,
      [:slug, :name]
    ]
  end
end
