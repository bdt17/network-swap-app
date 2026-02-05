Rails.application.configure do
  # Core production settings
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.force_ssl = true
  config.log_level = :info

  # Propshaft (Rails 8 default) - NO assets config needed
  config.public_file_server.enabled = true

  # i18n & deprecation
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  
  config.active_record.async_query_executor = :global_thread_pool
end
