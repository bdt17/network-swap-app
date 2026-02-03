#!/usr/bin/env ruby
require "bundler/setup"
require "./app.rb"

# Direct Puma - String host:port format for Render
app = ThomasIT.new
Puma::Server.new(app).tap do |s|
  s.add_tcp_listener "0.0.0.0:#{ENV['PORT'] || 3000}"
end.run.join
