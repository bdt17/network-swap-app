Rails.application.configure do
  config.hosts << "localhost"
  config.hosts << "127.0.0.1"
  
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  
  config.secret_key_base = ENV.fetch("SECRET_KEY_BASE") { "development_key_for_testing_only" }
  
  # COMPLETE LOGGER FIX
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.log_level = :debug
  config.log_formatter = proc do |severity, datetime, progname, msg|
    "#{datetime.strftime('[%Y-%m-%d %H:%M:%S.%3N]')} %5s -- %s\n" % [severity, msg]
  end
  
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
end
