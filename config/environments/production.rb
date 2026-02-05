Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false  # ← KEY FIX
  config.secret_key_base = "a1b2c3d4e5f6789012345678901234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef123456"
end

# Skip assets for API-only Rack app
config.assets.compile = false
config.assets.precompile = []
