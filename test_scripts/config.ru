#!/usr/bin/env ruby
# Rack::Builder DSL wrapper - guaranteed to work
Rack::Builder.new do
  require './app.rb'
  run ThomasIT
end
