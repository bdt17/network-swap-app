Rails.application.configure do
  # Disable credentials encryption (Render fix)
  config.require_master_key = false
  
  # Core production settings
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = true
  config.log_level = :info
  
  # Phase 14/10 Thomas IT
  config.force_ssl = true
end
