# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.secret_key = ENV['DEVISE_SECRET']
  config.mailer_sender = 'support@trekhub.in'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.allow_unconfirmed_access_for = 2.days
  config.confirm_within = 3.days
  config.reconfirmable = true
  config.confirmation_keys = [:email]
  config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = false
  config.extend_remember_period = true
  config.password_length = 8..72
  config.email_regexp = /\A[^@]+@[^@]+\z/
  config.reset_password_keys = [:email]
  config.reset_password_within = 12.hours
  config.sign_out_via = :delete
  config.omniauth :facebook, ENV['FB_KEY'], ENV['FB_SECRET']
  config.omniauth :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'],
                  name: 'google'
end
