#
class Activity < ActiveRecord::Base
  extend FriendlyId
  extend Enumerize
  include SearchableActivity

  belongs_to :destination
  belongs_to :vendor
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :galleries
  has_many :enquiries

  accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

  validates :title, :overview, :itinerary, :price, :start_date,
            :difficulty, :brief, :destination_id, :vendor_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  # { Case sensitive: false } option makes sure Title != title. Both will be treated as same.
  validates :title, uniqueness: { case_sensitive: false }
  validate :end_date_after_start_date

  # Slugged candidates can also be used. Since, title is a unique attribute, just title would be sufficient.
  friendly_id :title, use: [:slugged, :finders, :history]
  
  # If you add more categories or difficulties, don't forget at add them to contollers (static pages) and views as well.
  enumerize :difficulty, in: [:easy, :moderate, :challenging]
  enumerize :handcrafted_category, in: [:weekend_getaway, :team_outing,
                                        :elderly_activity, :women_special], scope: :handcrafted

  # Use multiple options of carrierwave such as resize_to_fit or resize_to_fill and size of the images to configure.
  mount_uploader :cover, CoverUploader

  # Maybe published should also be scoped if and when implemented.
  scope :recent,          -> { order(created_at: :desc) }
  scope :latest,          -> (number) { recent.limit(number) }
  scope :featured,        -> { where(featured: true) }
  scope :in_destination,  lambda { |destination| joins(:destination).where(destinations: { name: destination.name }) }
  scope :in_category,     lambda { |category| joins(:categorizations).where(category: category.name) }
  scope :in_vendor,       lambda { |vendor| joins(:vendor).where(vendors: { name: vendor.name }) }

  protected 
  
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, 'must be after start date') if end_date < start_date
  end

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categorizations.build(category: category)
    end
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
end
