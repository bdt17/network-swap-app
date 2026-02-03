#!/usr/bin/env ruby
require "bundler/setup"
require "./app.rb"

Rack::Builder.new do
  use Rack::CommonLogger
  run ThomasIT
end
