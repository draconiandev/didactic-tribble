# Change to sendgrid for production and staging
ActionMailer::Base.smtp_settings = {
  address: 							'smtp.gmail.com',
  port:                 587,
  domain:               ENV['SMTP_DOMAIN'],
  user_name:            ENV['SMTP_USERNAME'],
  password:             ENV['SMTP_PASSWORD'],
  authentication:       'plain',
  enable_starttls_auto: true
}
