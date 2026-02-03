#!/usr/bin/env ruby
require "bundler/setup"
require "rack/handler/puma"
require "./app.rb"

Rack::Handler::Puma.run(
  ThomasIT.new,
  Port: (ENV['PORT'] || 3000).to_i,
  Host: '0.0.0.0'
)
