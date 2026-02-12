Rails.application.configure do
  config.eager_load = true
  config.force_ssl = true
  config.log_level = :info
  config.cache_classes = true
  config.require_master_key = false
end
