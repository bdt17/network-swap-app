Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = false  # Propshaft handles this
  config.assets.compile = false              # No runtime compilation
  config.force_ssl = true
  
  config.log_level = :info
  config.log_tags = [ :request_id ]
  
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  
  config.active_record.async_query_executor = :global_thread_pool
end
