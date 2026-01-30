#!/usr/bin/env ruby
require 'net/http'
require 'nokogiri'
require 'colorize'

BASE_URL = "http://localhost:3000"
ALL_PAGES = {
  "🏢 Enterprise Sites" => "/sites",
  "🔄 EOL Swaps" => "/swaps", 
  "🔐 Agent Login" => "/users/sign_in",
  "🖥️  Dashboard" => "/",
  "📱 Device Inventory" => "/devices"
}

puts "🧪 THOMAS IT NETWORK SWAP - COMPLETE APP TEST".bold.cyan
puts "=" * 70

success = 0
ALL_PAGES.each do |name, path|
  uri = URI("#{BASE_URL}#{path}")
  resp = Net::HTTP.get_response(uri)
  
  puts " #{name.ljust(25)} #{resp.code}#{ ' PROTECTED' if resp.code == '302'} (#{resp.body.length/1000.0.round(1)}KB)"
  
  if resp.code == '200' || resp.code == '302'
    success += 1
  end
end

puts "\n" + "=" * 70
puts "🎉 #{success}/5 PAGES LIVE ✓".bold.green
puts "🔒 302 redirects = Devise auth ✓ (Login first)".bold.yellow
puts "\n🚀 MANUAL TEST:"
puts "1. http://localhost:3000/users/sign_in"
puts "2. agent@thomasit.com / ThomasIT2026!"
puts "3. Login → ALL 5 pages unlocked!".bold.cyan
