#!/usr/bin/env ruby
require "bundler/setup"
require "./app.rb"

# Create Rack app manually - NO DSL needed
handler = Rack::Handler::Puma
handler.run(ThomasIT.new, Port: ENV['PORT'], Host: '0.0.0.0')
