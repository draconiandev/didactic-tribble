class Article < ActiveRecord::Base
  extend FriendlyId
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, uniqueness: { case_sensitive: false }
  validates :body, presence: true

  friendly_id :title, use: [:slugged, :finders, :history]

  mount_uploader :cover, CoverUploader

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
