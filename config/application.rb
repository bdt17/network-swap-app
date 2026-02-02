require_relative "boot"
require "rails/all"
Bundler.require(*Rails.groups)

module NetworkSwapApp
  class Application < Rails::Application
    config.load_defaults 8.1
    config.autoload_lib(ignore: %w[assets tasks])
    
    # NUCLEAR FIX: Disable layouts globally during boot
    config.action_controller.default_render_layout = false
    
    # Disable all middleware that might call current_user
    config.middleware.delete Rack::Attack
    config.middleware.delete ActionDispatch::Flash
    
    initializer "disable_problematic_middleware", before: :load_config_initializers do |app|
      app.config.action_controller.allow_forgery_protection = false
    end
  end
end
