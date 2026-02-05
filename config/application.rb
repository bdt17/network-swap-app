require_relative "boot"

require "rails"
Bundler.require(*Rails.groups)

module NetworkSwapApp
  class Application < Rails::Application
    config.load_defaults 8.1
    config.api_only = true
  end
end
