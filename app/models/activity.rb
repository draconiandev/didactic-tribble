#
class Activity < ActiveRecord::Base
  extend FriendlyId
  extend Enumerize
  include PgSearch

  belongs_to :destination
  belongs_to :vendor
  has_many :categorizations, dependent: :delete_all
  has_many :categories, through: :categorizations, dependent: :destroy
  has_many :enquiries
  has_many :galleries

  accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

  validates :brief, :destination_id, :difficulty, :itinerary, :overview, :price,
            :start_date, :title, :vendor_id, presence: true
  validate :end_date_after_start_date
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  # { Case sensitive: false } option makes sure Title != title. Both will be treated as same.
  validates :title, uniqueness: { case_sensitive: false }

  # Slugged candidates can also be used. Since, title is a unique attribute, just title would be sufficient.
  friendly_id :title, use: [:slugged, :finders, :history]
  
  # If you add more categories or difficulties, don't forget at add them to contollers (static pages) and views as well.
  enumerize :difficulty, in: [:easy, :moderate, :challenging]
  enumerize :handcrafted_category, in: [:weekend_getaway, :team_outing,
                                        :elderly_activity, :women_special], scope: :handcrafted

  # Use multiple options of carrierwave such as resize_to_fit or resize_to_fill and size of the images to configure.
  mount_uploader :cover, CoverUploader

  pg_search_scope :activity_search, against: :title,
                                    associated_against: {
                                      destination: :name,
                                      categories: :name
                                    },
                                    using: {
                                      tsearch: { any_word: true, prefix: true, dictionary: 'english' },
                                      trigram: { threshold: 0.1 }
                                    }
  # Maybe published should also be scoped if and when implemented.
  scope :recent,        -> { order(created_at: :desc) }
  scope :latest,        -> (number) { recent.limit(number) }
  scope :featured,      -> { where(featured: true) }

  private

  def self.in_destination(destination)
    joins(:destination).where(destinations: { name: destination.name })
  end

  def self.in_category(category)
    category.activities.includes(:destination, :categories)
            .uniq.sort_by(&:id)
  end

  def self.by_vendor(vendor)
    joins(:vendor).where(vendors: { name: vendor.name })
  end

  def self.related_activities(activity)
    joins(:categorizations)
    .where(categorizations: { category_id: activity.category_ids })
    .where('activities.id != ?', activity.id).distinct
    .limit(3).includes(:destination)
  end

  def self.nearby_activities(activity)
    joins(:destination)
    .where(destinations: { name: activity.destination.name })
    .where('activities.id != ?', activity.id)
    .order("RANDOM()").limit(3).includes(:destination, :categories)
  end
  
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, 'must be after start date') if end_date < start_date
  end

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find(category_attribute)
      self.categorizations.build(category: category)
    end
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
