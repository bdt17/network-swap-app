Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.api_only = true
  
  # Generate inline secret - no env vars needed
  config.secret_key_base = "a"*64
  
  # Disable all storage/verifiers
  config.active_storage.service_configurations = {}
  config.active_storage.skip_file_verification = true
end
