class Vendor < ActiveRecord::Base
  has_many :activities
  has_many :subscriptions
  has_many :categories, through: :subscriptions

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.subscriptions.build(category: category)
    end
  end
end
