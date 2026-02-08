require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module NetworkSwapApp
  class Application < Rails::Application
    config.api_only = true
    config.load_defaults 8.1
    config.public_file_server.enabled = true
  end
end
