class Contact < MailForm::Base
  attribute :name,      validate: true
  attribute :email,     validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone,     validate: /([0]|\+91)?[789]\d{9}/
  attribute :message
  attribute :nickname,  captcha: true

  def headers
    {
      subject: "Mail from Contact Form",
      to: 'abhishek.trek@gmail.com',
      from: %("#{name}" <#{email}>)
    }
  end
end