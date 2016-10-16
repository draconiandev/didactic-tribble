class Gallery < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :activity
  belongs_to :article

  validates :image, presence: true
end
