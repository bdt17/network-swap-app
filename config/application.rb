require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module NetworkSwapApp
  class Application < Rails::Application
    # Disable credentials entirely
    config.require_master_key = false
    
    # Static assets only for MVP
    config.public_file_server.enabled = true
    config.serve_static_assets = true
    
    # Skip framework defaults
    config.active_record.encryption.primary_key = nil
    config.active_record.encryption.deterministic_key = nil
    config.active_record.encryption.key_derivation_salt = nil
    
    # Skip migrations, sessions, etc
    config.active_record.schema_migrate = false
    config.session_store :disabled
  end
end
