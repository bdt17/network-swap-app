Rails.application.configure do
  # Skip credentials completely
  config.require_master_key = false
  
  # Essential production settings
  config.eager_load = true
  config.force_ssl = true
  config.log_level = :info
  config.cache_classes = true
  
  # Skip asset pipeline (Propshaft)
  config.assets.compile = false
  
  # Disable encrypted config
  config.active_record.encryption.primary_key = nil
  config.active_record.encryption.deterministic_key = nil
  config.active_record.encryption.key_derivation_salt = nil
end
