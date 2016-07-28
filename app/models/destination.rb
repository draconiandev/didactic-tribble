#
class Destination < ActiveRecord::Base
  geocoded_by :name
  after_validation :geocode
  has_many :activities, dependent: :destroy

  validates :name, :description, :brief, :slug, presence: true

  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders, :history]

  include SearchableDestination

  mount_uploader :cover, CoverUploader

  def should_generate_new_friendly_id?
    slug.blank? || slug_changed?
  end
end
