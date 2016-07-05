# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('Running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :poltergeist
# OmniAuth.config.test_mode = true

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.order = :random

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |suite|
    DatabaseCleaner.strategy = suite.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers
  # config.include Omniauth::Mock
  # config.include Omniauth::SessionHelpers,  type: :feature
  config.include Features,                    type: :feature
  config.include Devise::TestHelpers,         type: :controller

  config.before :suite do
    Warden.test_mode!
  end

  Shoulda::Matchers.configure do |configure|
    configure.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
