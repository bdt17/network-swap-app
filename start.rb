#!/usr/bin/env ruby
require 'rack'
require 'rack/static'

use Rack::Static, 
  root: 'public',
  urls: ['/js', '/css', '/swap', '/favicon.ico'],
  index: ['index.html']

map '/' do
  run lambda { |env|
    [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]]
  }
end
