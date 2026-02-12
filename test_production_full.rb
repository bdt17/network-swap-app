#!/usr/bin/env ruby
urls = %w[/tech /dispatch /enterprise /api/swaps /health]
urls.each do |u|
  res = `curl -s -o /dev/null -w "%{http_code}" https://network-swap-static.onrender.com#{u}`
  puts "#{res} #{u}"
end
