require_relative "boot"

require "rails/all"

# DISABLE ActiveStorage
Bundler.require(*Rails.groups)
module NetworkSwapApp
  class Application < Rails::Application
    config.load_defaults 8.1
    config.api_only = true
    
    # BLOCK ActiveStorage initialization
    config.active_storage.draw_routes = false
    initializer "disable_activestorage", before: :load_config_initializers do |app|
      app.config.active_storage.service = nil
      ActiveStorage::Engine.skip = true
    end
  end
end
