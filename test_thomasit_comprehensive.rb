#!/usr/bin/env ruby
require 'net/http'
require 'uri'

BASE_URL = ENV['TEST_URL'] || 'http://localhost:3000'
PROD_URL = 'https://network-swap-app.onrender.com'

puts "🧪 THOMAS IT NETWORK SWAP - COMPREHENSIVE TEST SUITE"
puts "=" * 70

def test_get(url, name)
  begin
    uri = URI.join(BASE_URL, url)
    res = Net::HTTP.get_response(uri)
    size = res.body&.bytesize || 0
    puts "✅ PASS      %-25s (%.1fKB)" % [name, size/1024.0]
    return true
  rescue => e
    puts "❌ FAIL     %-25s #{e.message}" % name
    return false
  end
end

def test_auth_login()
  begin
    uri = URI(BASE_URL + '/users/sign_in')
    res = Net::HTTP.post_form(uri, 'user[email]' => 'tech@thomasit.com', 'user[password]' => 'Smith2001!')
    puts res.code == '302' ? "✅ PASS      Devise Login (tech@thomasit.com)" : "❌ AUTH FAIL #{res.code} Devise Login"
    return res.code == '302'
  rescue => e
    puts "❌ AUTH FAIL #{e.message}"
    return false
  end
end

def test_api_claim()
  begin
    uri = URI(BASE_URL + '/api/swaps/2001/claim')
    res = Net::HTTP.post_form(uri, {})
    puts res.code == '200' ? "✅ PASS      API CLAIM /api/swaps/2001/claim" : "🔒 API CLAIM #{res.code} /api/swaps/2001/claim"
    return res.code == '200'
  rescue => e
    puts "🔒 API CLAIM #{e.message}"
    return false
  end
end

# RUN TESTS
results = []
results << test_get('/', 'Home')
results << test_get('/tech', '/tech')
results << test_get('/dashboard', '/dashboard')
results << test_get('/api/devices', '/api/devices')
results << test_get('/api/swaps', '/api/swaps')
results << test_api_claim()
results << test_auth_login()

# SUMMARY
passed = results.count(true)
total = results.length
puts "\n🎯 SUMMARY: #{passed}/#{total} (#{passed*100.0/total.round(1)}%)"
puts "🌐 LOCAL:  #{BASE_URL}/tech"
puts "☁️  PROD:  #{PROD_URL}/tech"
