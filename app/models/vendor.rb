class Vendor < ActiveRecord::Base
  has_many :activities
  has_many :subscriptions
  has_many :categories, through: :subscriptions

  validates :name, :address, :phone, :email, presence: true
  validates :name, length: {minimum: 3}

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.subscriptions.build(category: category)
    end
  end
end
