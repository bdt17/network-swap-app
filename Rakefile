# Load Rails environment
require_relative "config/application"

if defined?(Rails::Command)
  require "rails/commands"
else
  require_relative "config/environment"
  Rails.application.load_tasks
end
