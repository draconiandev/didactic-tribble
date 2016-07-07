#
class Destination < ActiveRecord::Base
  has_many :activities, dependent: :destroy

  validates :name, :description, :brief, :slug, presence: true

  # mount_uploader :cover, CoverUploader
end
