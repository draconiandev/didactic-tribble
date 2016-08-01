class Enquiry < ActiveRecord::Base
  include MailForm::Delivery
  belongs_to :activity

  before_save :save_attributes

  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     validate: true
  attribute :message
  attribute :nickname,  captcha: true

  def headers
    {
      subject: "Enquiry for #{activity.title}",
      to: "abhishek.trek@gmail.com", 
      cc: activity.vendor.email,
      from: %("#{name}" <#{email}>)
    }
  end

  private

  def save_attributes
    # name = self.name
    email = self.email
    phone = self.phone
    message = self.message
  end
end
