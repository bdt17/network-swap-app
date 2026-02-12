#!/usr/bin/env ruby
require "net/http"
require "uri"
require "json"

BASE_URL = "https://network-swap-app.onrender.com"

def test_prod(url, method="GET")
  uri = URI("#{BASE_URL}#{url}")
  req = method=="POST" ? Net::HTTP::Post.new(uri) : Net::HTTP::Get.new(uri)
  req["Content-Type"] = "application/json" if method=="POST"
  req.body = '{"device_id":9999,"site_id":1}' if method=="POST"
  
  res = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
    http.request(req)
  end
  
  puts "#{res.code} #{url} #{res.body.size/1024.0}KB"
  res.code.start_with?("2")
end

puts "🌐 PRODUCTION HEALTH CHECK"
puts "="*50

pages = %w[/tech /dispatch /enterprise /eol_swaps /inventory]
pages_ok = pages.all? { |p| test_prod(p) }

apis_ok = test_prod("/api/swaps", "POST") && test_prod("/api/swaps/2001/claim", "POST")

puts "\n🎯 RESULTS:"
puts "Pages: #{pages_ok ? '5/5' : '0/5'}"
puts "APIs:  #{apis_ok ? '2/2' : '0/2'}"
puts "LIVE: #{BASE_URL}/dispatch"
puts apis_ok && pages_ok ? "✅ PRODUCTION READY!" : "⚠️  Fix production issues"
