#!/usr/bin/env ruby
require 'rack'
require 'rack/contrib/static_cache'

use Rack::StaticCache, public_folder: './public'
run ->(env) { 
  path = env['PATH_INFO']
  if File.exist?("public#{path}")
    [200, {'Content-Type' => 'text/html'}, [File.read("public#{path}")]]
  else
    [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]]
  end
}
