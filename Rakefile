# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake
# and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
# require 'bundler/audit/task'

Rails.application.load_tasks
task(:default).clear
task default: [:spec]

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = true
  end
end

# Bundler::Audit::Task.new

# task default: 'bundle:audit'
