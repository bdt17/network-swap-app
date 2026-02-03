#!/usr/bin/env ruby
require "bundler/setup"
require "puma"
require "./app.rb"

app = ThomasIT.new
Puma::Server.new(app).tap do |s|
  s.add_tcp_listener ENV['PORT'] || 3000, '0.0.0.0'
end.run.join
