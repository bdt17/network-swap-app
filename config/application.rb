require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module NetworkSwapApp
  class Application < Rails::Application
    config.load_defaults 8.1
    config.api_only = false
    config.generators.system_tests = nil
    
    # Fix TailwindCSS assets
  end
end
