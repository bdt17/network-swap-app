#!/usr/bin/env ruby
require './app.rb'

app = ThomasIT.new
app.set :port, ENV['PORT'] || 10000
app.set :bind, '0.0.0.0'
app
