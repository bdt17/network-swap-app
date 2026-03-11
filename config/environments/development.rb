Rails.application.configure do
  config.eager_load = false
  # Core settings
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.server_timing = true

  # Action Mailer
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Logger
  config.logger = Logger.new(STDOUT)

  # Assets
  config.assets.compile = true

  # Hosts
  config.hosts.clear

  # Database encryption (your existing)
  config.active_record.encryption.primary_key = ENV["ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY"]
  config.active_record.encryption.deterministic_key = ENV["ACTIVE_RECORD_ENCRYPTION_DETERMINISTIC_KEY"]
  config.active_record.encryption.key_derivation_salt = ENV["ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT"]
end
