#!/usr/bin/env ruby
require "bundler/setup"
require "./app.rb"

# Start Puma directly - no rackup needed
map "/" do
  run ThomasIT
end.run!
