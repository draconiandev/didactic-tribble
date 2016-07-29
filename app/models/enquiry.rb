class Enquiry < ActiveRecord::Base
  include MailForm::Delivery
  belongs_to :activity

  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     validate: true
  attribute :message
  attribute :nickname,  captcha: true

  # def activity_title
  #   self.all { |activity| title = activity.title }
  #   title
  # end

  # def activity_id
  #   self.activity.title
  # end

  def headers
    {
      subject: "Enquiry for #{activity.title}",
      to: "pavanprakash21@gmail.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
