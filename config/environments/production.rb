Rails.application.configure do
  # Core production settings
  config.eager_load = true
  config.force_ssl = true
  config.log_level = :info
  config.cache_classes = true
  
  # Rails 8.1 Propshaft - NO assets config needed
  config.require_master_key = false
  
  # Skip migrations (no DB yet)
  config.active_record.schema_format = :sql

  config.public_file_server.enabled = true
  config.public_file_server.headers = {
  'Cache-Control' => "public, max-age=#{1.hour.to_i}"
}
end
