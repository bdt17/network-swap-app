# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Force static file serving
Rails.application.configure do
  config.public_file_server.enabled = true
  config.serve_static_assets = true
end
