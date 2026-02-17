Rails.application.configure do
  # Thomas IT Network Swap - Phase 14/10 PRODUCTION
  config.require_master_key = false
  
  # Core production settings
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  
  # Static assets (Render)
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }
  
  # Logging
  config.log_level = :info
  config.log_tags = [ :request_id ]
  
  # Security
  config.force_ssl = true
  config.session_store :cookie_store, key: '_network_swap_session'
  
  # Render optimizations
  config.assets.compile = false
  config.assets.digest = true
  
  # Don't dump schema
  config.active_record.dump_schema_after_migration = false
end
