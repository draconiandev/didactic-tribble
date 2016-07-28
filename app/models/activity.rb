#
class Activity < ActiveRecord::Base

  belongs_to :destination
  belongs_to :vendor
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :galleries

  accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

  validates :title, :overview, :itinerary, :price, :start_date,
            :difficulty, :brief, :slug, :destination_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { case_sensitive: false }
  validate :end_date_after_start_date

  extend FriendlyId
  friendly_id :slug, use: [:slugged, :finders, :history]
  
  extend Enumerize
  enumerize :difficulty, in: [:easy, :moderate, :challenging]
  enumerize :handcrafted_category, in: [:weekend_getaway, :team_outing,
                                        :elderly_activity, :women_special], scope: :handcrafted

  include SearchableActivity

  mount_uploader :cover, CoverUploader

  scope :recent,          -> { order(created_at: :desc) }
  scope :latest,          -> (number) { recent.limit(number) }
  scope :published,       -> { where.not(published_at: nil) }
  scope :drafts,          -> { where(published_at: nil) }
  scope :featured,        -> { where(featured: true) }
  scope :in_destination,  lambda { |destination| joins(:destination).where(destinations: { name: destination.name }) }
  scope :in_category,     lambda { |category| joins(:categories).where("categories.name = ?", category.name) }
  scope :in_vendor,       lambda { |vendor| joins(:vendor).where(vendors: { name: vendor.name }) }

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, 'must be after start date') if end_date < start_date
  end

  # def related_activities
  #   Activity.includes(self.category_id = category.id)
  # end

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categorizations.build(category: category)
    end
  end

  def publish
    self.published_at = Time.zone.now
    self.slug = nil # let FriendlyId generate slug
    save
  end

  def save_as_draft
    self.published_at = nil
    self.slug ||= SecureRandom.urlsafe_base64
    save(validate: false)
  end

  def unpublish
    self.published_at = nil
  end

  def published?
    published_at.present?
  end

  def should_generate_new_friendly_id?
    slug.blank? || slug_changed?
  end
end
