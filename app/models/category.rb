#
class Category < ActiveRecord::Base
  extend Enumerize
  extend FriendlyId
  include PgSearch

  has_many :subscriptions
  has_many :categorizations, dependent: :destroy
  has_many :vendors, through: :subscriptions
  has_many :activities, through: :categorizations, dependent: :destroy
  
  validates :name, :description, :brief, :main_category, presence: true
  validates :name, uniqueness: true

  enumerize :main_category, in: [:air, :water, :land]

  friendly_id :name, use: [:slugged, :finders, :history]

  mount_uploader :cover, CoverUploader

  pg_search_scope :category_search, against: :name,
                                    using: {
                                      tsearch: { any_word: true, prefix: true, dictionary: 'english' },
                                      trigram: { threshold: 0.1 }
                                    }

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
