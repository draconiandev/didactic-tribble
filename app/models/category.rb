#
class Category < ActiveRecord::Base
  has_many :activities, dependent: :destroy

  extend Enumerize
  enumerize :main_category, in: [:air, :water, :land]

  validates :name, :description, :brief, :main_category,
            :slug, presence: true
  validates :name, uniqueness: true

  # mount_uploader :cover, CoverUploader
end
