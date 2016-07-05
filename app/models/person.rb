class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  validates :name, :email, presence: true
  validates :name, format: { with: /\A[a-zA-Z. ]*\z/,
                             message: 'Please use only English Alphabets' }

  def first_name
    name.blank? ? '' : name.split(' ')[0].titleize
  end
end
