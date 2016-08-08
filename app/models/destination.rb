#
class Destination < ActiveRecord::Base
  extend FriendlyId
  include PgSearch

  has_many :activities, dependent: :destroy

  validates :name, :description, :brief, presence: true

  friendly_id :name, use: [:slugged, :finders, :history]
  geocoded_by :name
  after_validation :geocode

  mount_uploader :cover, CoverUploader

  pg_search_scope :destination_search, against: :name,
                                       using: {
                                        tsearch: { any_word: true, prefix: true, dictionary: 'english' },
                                        trigram: { threshold: 0.1 }
                                      }

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
