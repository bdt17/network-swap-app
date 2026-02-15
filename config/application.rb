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
    
    # CRITICAL: Enable sessions for Devise (FIXES 401 errors)
    config.session_store :cookie_store, key: '_network_swap_session'
    
    # Enable HTML views (your app needs this)
    config.api_only = false
    
    # Serve static files
    config.public_file_server.enabled = true
    
    # Timezone for Phoenix
    config.time_zone = 'Mountain Time (US & Canada)'
    
    # Redis for ActionCable (Phase 14 real-time drone updates)
    config.action_cable.url = 'redis://localhost:6379'
  end
end

ENV['RESTART_ON_DEPLOY'] = 'true'
