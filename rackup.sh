#!/bin/bash
# Auto-convert Rails to Rackup

echo "=== Creating config.ru ==="
cat > config.ru << 'RACK'
require 'bundler/setup'

# Middleware stack
use Rack::Deflater
use Rack::Static, :urls => ['/css', '/js', '/images'], :root => 'public'
use Rack::Session::Cookie, :secret => ENV['SESSION_SECRET'] || 'devkey'
use Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options]
  end
end

# Load Rails as Rack app (simplest migration)
require File.expand_path('config.ru.rails', __dir__) if File.exist?('config.ru.rails')
require './app_rack'  # Main Rack app

run NetworkSwapRack
RACK

echo "=== Creating app_rack.rb (Rack wrapper) ==="
cat > app_rack.rb << 'RACKAPP'
require 'rack'
require 'json'

class NetworkSwapRack
  def self.call(env)
    req = Rack::Request.new(env)
    
    # Proxy to Rails for ALL routes (zero code rewrite)
    if File.exist?('config/environment.rb')
      require './config/environment'
      Rails.application.call(env)
    else
      # Fallback routes
      case req.path
      when '/' then index_page
      when '/health' then [200, {'Content-Type' => 'text/plain'}, ['OK']]
      else [404, {'Content-Type' => 'text/plain'}, ['Not Found']]
      end
    end
  end

  def self.index_page
    [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html', encoding: 'utf-8')]]
  end
end
RACKAPP

echo "=== Test locally ==="
bundle exec rackup config.ru -p 3000 -o 0.0.0.0
