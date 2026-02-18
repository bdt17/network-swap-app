#!/usr/bin/env ruby
require "net/http"
require "uri"

BASE_URL = "http://localhost:3000"
TEST_PAGES = ["/tech", "/enterprise", "/eol_swaps", "/dashboard", "/inventory"]

puts "🧪 THOMAS IT LOCAL TEST\n#{'='*70}"
live = 0

TEST_PAGES.each do |path|
  begin
    uri = URI("#{BASE_URL}#{path}")
    response = Net::HTTP.get_response(uri)
    size = response.body.length / 1024.0
    puts " #{path.ljust(25)} #{response.code.ljust(3)} (#{"%.1f" % size}KB)"
    live += 1 if response.code == "200"
  rescue => e
    puts " #{path.ljust(25)} ERROR #{e.message}"
  end
end

puts "#{'='*70}"
puts "🎉 #{live}/#{TEST_PAGES.length} PAGES LIVE ✓"
puts "\n🚀 LIVE: http://localhost:3000/tech"
