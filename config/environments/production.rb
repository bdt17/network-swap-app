Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = true

  # BYPASS RAILS_MASTER_KEY - Direct secret_key_base
  config.secret_key_base = "a_very_long_random_string_128_chars_minimum_like_this_one_for_production_security_1234567890abcdef"

  config.require_master_key = false
  config.read_encrypted_secrets = false

  config.active_record.async_query_executor = :global_thread_pool
  config.active_storage.variant_processor = :vips
end
