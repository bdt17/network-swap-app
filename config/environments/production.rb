Rails.application.configure do
  config.eager_load = true
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
end

# FORCE assets work on Render
config.assets.compile = true
config.serve_static_assets = true
config.public_file_server.enabled = true
config.public_file_server.headers = {
  'Cache-Control' => "public, max-age=#{1.hour.to_i}"
}
Rails.application.config.force_ssl = true
config.assets.compile = true
config.assets.compile = true
