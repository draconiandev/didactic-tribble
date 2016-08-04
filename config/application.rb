require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require 'dotenv/rails-now'
Dotenv.load

Bundler.require(*Rails.groups)

module TrekHub
  #
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.time_zone = 'Chennai'
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.active_job.queue_adapter = :active_job
    config.generators do |generate|
      generate.test_framework :rspec
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.view_specs false
    end
  end
end
