#!/usr/bin/env ruby
require "bundler/setup"
require "./app.rb"

# Pure Rack Handler - NO DSL, NO rackup needed
Rack::Handler::Puma.run(
  ThomasIT.new,
  Port: (ENV['PORT'] || 3000).to_i,
  Host: '0.0.0.0'
)
