class Vendor < ActiveRecord::Base
  has_many :activities
  has_many :subscriptions
  has_many :categories, through: :subscriptions

  validates :name, :address, :phone, :email, presence: true
  validates :name, length: {minimum: 3}

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.subscriptions.build(category: category)
    end
  end

  def should_generate_new_friendly_id?
    name.blank? || name_changed?
  end
end
