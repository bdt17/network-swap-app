Rails.application.configure do
  config.eager_load = true
  config.require_master_key = false
  config.force_ssl = true
  config.log_level = :info
  config.cache_classes = true
end
