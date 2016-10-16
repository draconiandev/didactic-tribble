class Article < ActiveRecord::Base
  extend FriendlyId

  validates :title, uniqueness: { case_sensitive: false }
  validates :body, presence: true

  friendly_id :title, use: [:slugged, :finders, :history]

  mount_uploader :cover, CoverUploader
end
