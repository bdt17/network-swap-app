Rails.application.configure do
  # All config settings must be INSIDE this block
  config.eager_load = true
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.force_ssl = true
  config.log_level = :info
  config.i18n.fallbacks = [I18n.default_locale]
end
config.eager_load = true
config.public_file_server.enabled = true
config.eager_load = true
