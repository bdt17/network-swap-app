#!/usr/bin/env ruby
require 'rack/builder'
require './app.rb'

Rack::Builder.new do
  run ThomasIT
end
