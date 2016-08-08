#
class Person < ActiveRecord::Base
  extend Enumerize
  include OmniauthablePerson
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :omniauthable,
         omniauth_providers: [:facebook, :google]

  validates :name, :email, presence: true
  validates :name, format: { with: /\A[a-zA-Z. ]*\z/,
                             message: 'Please use only English Alphabets' }

  enumerize :role, in: [:user, :editor, :admin],
                   default: :user, predicates: true

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  scope :registered,      -> { where(provider: nil) }
  scope :omniauthed,      -> { where.not(provider: nil) }

  def should_generate_new_friendly_id?
    name.blank? || name_changed?
  end
end
