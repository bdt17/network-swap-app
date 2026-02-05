Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.api_only = true
  config.secret_key_base = "a1b2c3d4e5f6789012345678901234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef123456"
end
