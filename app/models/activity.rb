#
class Activity < ActiveRecord::Base
  belongs_to :destination
  belongs_to :category
  has_many :galleries

  accepts_nested_attributes_for :galleries

  validates :title, :overview, :itinerary, :price, :start_date,
            :difficulty, :brief, :slug, :destination_id, :category_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { case_sensitive: false }
  validate :end_date_after_start_date

  extend Enumerize
  enumerize :difficulty, in: [:easy, :moderate, :challenging]
  enumerize :handcrafted_category, in: [:weekend_getaway, :team_outing,
                                        :elderly_activity, :women_special]

  mount_uploader :cover, CoverUploader

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    errors.add(:end_date, 'must be after start date') if end_date < start_date
  end
end
