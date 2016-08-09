# Change to sendgrid for production and staging
ActionMailer::Base.smtp_settings = {
  address: 							'smtp.sendgrid.net',
  port:                 587,
  host:                 'trekhub.in'
  domain:               ENV['SMTP_DOMAIN'],
  user_name:            ENV['SENDGRID_USERNAME'],
  password:             ENV['SENDGRID_PASSWORD'],
  authentication:       'plain',
  enable_starttls_auto: true
}
