require_relative "boot"

require "rails"
Bundler.require(*Rails.groups)

module NetworkSwapApp
  class Application < Rails::Application
    config.load_defaults 8.1
    config.api_only = true
    
    # Disable ActiveStorage routes
    config.active_storage.draw_routes = false
    
    # Skip ActionText (also in your bundle)
    config.action_text = false
  end
end
