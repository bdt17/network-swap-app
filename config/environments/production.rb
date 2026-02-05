Rails.application.configure do
  # Essential production settings
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  
  # BYPASS secret_key_base
  config.secret_key_base = ENV['SECRET_KEY_BASE'] || "your_app_production_secret_1234567890abcdef"
  config.require_master_key = false
  
  # Propshaft (Rails 8 default) - NO assets:precompile needed
  config.public_file_server.enabled = true
  
  # API-only app
  config.api_only = true
end
