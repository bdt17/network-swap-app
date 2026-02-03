#!/usr/bin/env ruby
require 'rack'
require './app.rb'

map '/' do
  run ThomasIT
end
