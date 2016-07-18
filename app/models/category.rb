#
class Category < ActiveRecord::Base
  has_many :activities, dependent: :destroy

  validates :name, :description, :brief, :main_category,
            :slug, presence: true
  validates :name, uniqueness: true

  extend Enumerize
  enumerize :main_category, in: [:air, :water, :land]

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  include SearchableCategory

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
