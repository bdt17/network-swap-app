Rails.application.configure do
  # Existing settings + new ones
  config.eager_load = true
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.force_ssl = true
  config.log_level = :info
  config.i18n.fallbacks = [I18n.default_locale]
  
  # Your other production settings here...
end
  config.eager_load = true
