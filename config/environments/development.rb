Rails.application.configure do
  config.logger = ActiveSupport::Logger.new(STDOUT)
  config.log_level = :debug
  config.log_formatter = ActiveSupport::Logger::SimpleFormatter.new

  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true
  config.active_record.migration_error = :page_load
end
