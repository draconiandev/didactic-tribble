#
class Category < ActiveRecord::Base
  has_many :activities
  has_many :subscriptions
  has_many :vendors, through: :subscriptions

  validates :name, :description, :brief, :main_category,
            :slug, presence: true
  validates :name, uniqueness: true

  extend Enumerize
  enumerize :main_category, in: [:air, :water, :land]

  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders, :history]

  include SearchableCategory

  mount_uploader :cover, CoverUploader

  def should_generate_new_friendly_id?
    slug.blank? || slug_changed?
  end
end
