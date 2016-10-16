class Article < ActiveRecord::Base
  has_many :galleries
  accepts_nested_attributes_for :galleries, reject_if: :all_blank, allow_destroy: true

  validates :title, uniqueness: { case_sensitive: false }

  friendly_id :title, use: [:slugged, :finders, :history]
end
