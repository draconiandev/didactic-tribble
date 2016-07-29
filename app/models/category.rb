#
class Category < ActiveRecord::Base
  has_many :subscriptions
  has_many :categorizations
  has_many :vendors, through: :subscriptions
  has_many :activities, through: :categorizations
  
  validates :name, :description, :brief, :main_category, presence: true
  validates :name, uniqueness: true

  extend Enumerize
  enumerize :main_category, in: [:air, :water, :land]

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  include SearchableCategory

  mount_uploader :cover, CoverUploader

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  # def activities_attributes=(activity_attributes)
  #   activity_attributes.values.each do |activity_attribute|
  #     activity = Activity.find_or_create_by(activity_attribute)
  #     self.categorizations.build(activity: activity)
  #   end
  # end
end
