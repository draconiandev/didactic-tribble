#
class Destination < ActiveRecord::Base
  # has_many :activities, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  # validates :cover, presence: true
  validates :brief, presence: true
  validates :slug, presence: true

  # mount_uploader :cover, CoverUploader
end
