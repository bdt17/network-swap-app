require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module NetworkSwapApp
  class Application < Rails::Application
    config.load_defaults 8.1
    config.api_only = true
    config.public_file_server.enabled = true
  end
end
