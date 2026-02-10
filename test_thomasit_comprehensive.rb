#!/usr/bin/env ruby
require "net/http"
require "uri"
require "json"

BASE_URL = "http://localhost:3000"
PAGES = ["/tech", "/dispatch", "/enterprise", "/eol_swaps", "/inventory"]
API_ENDPOINTS = ["/api/swaps", "/api/swaps/2001/claim"]
TECH_FEATURES = ["Phoenix Site 21", "CLAIM THIS JOB", "Dispatch Tower"]

puts "🧪 THOMAS IT COMPREHENSIVE PHASE 9 TEST"
puts "=" * 80

live_pages = 0
api_live = 0
tech_features = 0

# Test all pages
puts "\n📄 STATIC PAGES"
PAGES.each do |path|
  begin
    uri = URI("#{BASE_URL}#{path}")
    response = Net::HTTP.get_response(uri)
    size = response.body.length / 1024.0
    status = response.code == "200" ? "✅ LIVE" : "❌ #{response.code}"
    puts " #{path.ljust(20)} #{status.ljust(10)} (#{size.round(1)}KB)"
    live_pages += 1 if response.code == "200"
  rescue => e
    puts " #{path.ljust(20)} ❌ ERROR #{e.message}"
  end
end

puts "\n🔌 API ENDPOINTS"
API_ENDPOINTS.each do |endpoint|
  begin
    uri = URI("#{BASE_URL}#{endpoint}")
    response = Net::HTTP.post_form(uri, {})
    status = response.code == "200" ? "✅ LIVE" : "❌ #{response.code}"
    puts " #{endpoint.ljust(25)} #{status}"
    api_live += 1 if response.code == "200"
  rescue => e
    puts " #{endpoint.ljust(25)} ❌ #{e.message}"
  end
end

puts "\n📱 TECH DASHBOARD FEATURES"
begin
  response = Net::HTTP.get_response(URI("#{BASE_URL}/tech"))
  TECH_FEATURES.each do |feature|
    if response.body.include?(feature)
      puts " ✅ #{feature}"
      tech_features += 1
    else
      puts " ❌ Missing: #{feature}"
    end
  end
rescue => e
  puts " ❌ Tech page load failed: #{e.message}"
end

puts "=" * 80
puts "🎉 SUMMARY:"
puts "   Pages: #{live_pages}/#{PAGES.length}"
puts "   APIs: #{api_live}/#{API_ENDPOINTS.length}"
puts "Features: #{tech_features}/#{TECH_FEATURES.length}"
puts "   LIVE: http://localhost:3000/tech" if live_pages > 0
puts "\n🚀 CLAIM TEST: curl -X POST http://localhost:3000/api/swaps/2001/claim"
