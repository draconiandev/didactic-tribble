class Enquiry < ActiveRecord::Base
  include MailForm::Delivery
  belongs_to :activity

  before_save :save_attributes

  attribute :name,      validate: /\A[a-zA-Z. ]*\z/
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     validate: /([0]|\+91)?[789]\d{9}/
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
    name = self.name
    email = self.email
    phone = self.phone
    message = self.message
  end
end
