# config/environments/production.rb

Rails.application.configure do
  # Disable serving assets in production unless explicitly enabled
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?

  # Code is not reloaded between requests; cache classes
  config.cache_classes = true

  # Eager load most of Rails and your app on boot
  config.eager_load = true

  # Full error reports are disabled; show more generic error pages
  config.consider_all_requests_local = false

  # Turn on caching in controllers (if you depend on it)
  config.action_controller.perform_caching = true

  # Compress assets
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  # Precompile assets in `rake assets:precompile`; do not fallback to Sprockets
  config.assets.compile = false
  config.assets.digest = true

  # Use a more aggressive log level in production
  config.log_level = :info

  # Use a default formatter so PIDs and timestamps are not stripped
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump the schema after every migration
  config.active_record.dump_schema_after_migration = false

  # Rails 7+ / any other existing settings go below here
  # e.g. config.force_ssl = true, config.cache_store = :redis_cache_store, etc.
end
