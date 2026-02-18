Rails.application.configure do
  # Thomas IT Network Swap - Phase 14/10 PRODUCTION (Phoenix AZ DC21)
  config.require_master_key = false

  # Core production settings
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Static assets (Render CDN optimized)
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  # Asset pipeline (Rails 8 - precompiled)
##  config.assets.compile = false
#  config.assets.digest = true
#  config.assets.js_compressor = :jscompressor  # Add 'jscompressor' gem if needed
#  config.assets.css_compressor = :yui          # Optional
#
  # Logging (Render log drains)
  config.log_level = :info
  config.log_tags = [ :request_id ]
  config.logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))

  # Security (Zero Trust Phase 7 prep)
  config.force_ssl = true
  config.session_store :cookie_store, key: '_network_swap_session'

  # Mailer (Phase 5 swap alerts)
  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV['SMTP_ADDRESS'],
    port: ENV['SMTP_PORT'],
    user_name: ENV['SMTP_USERNAME'],
    password: ENV['SMTP_PASSWORD'],
    authentication: :login
  }

  # API optimizations
  config.api_only = false  # Hybrid API + static dashboard
  config.active_record.verbose_query_logs = false

  # Job queue (Phase 6 ActionCable + swap_alert_job)
  # Job queue - inline for Phase 4-7 (no Sidekiq needed)
  config.active_job.queue_adapter = :inline

  # Don't dump schema after migrations
  config.active_record.dump_schema_after_migration = false

  # Phase 7 Zero Trust
  config.x.zero_trust_enabled = true if ENV['ZERO_TRUST_SECRET']
end
