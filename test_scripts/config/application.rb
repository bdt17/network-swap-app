require_relative "boot"

require "rails"
Bundler.require(*Rails.groups)

module NetworkSwapApp
  class Application < Rails::Application
    config.load_defaults 8.1
    config.api_only = true
    config.active_job.queue_adapter = :async  # For your jobs
  end
end
