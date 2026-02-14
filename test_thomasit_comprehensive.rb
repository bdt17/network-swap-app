#!/usr/bin/env ruby
require 'net/http'
require 'json'
require 'colorize'

BASE_URL = 'http://localhost:3000'
TIMEOUT = 5

def test_endpoint(path, expected_status = 200)
  begin
    uri = URI("#{BASE_URL}#{path}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = TIMEOUT
    http.read_timeout = TIMEOUT
    response = http.get(uri.request_uri)
    
    status = case response.code.to_i
             when expected_status then "✅ PASS".green
             else "❌ FAIL (#{response.code})".red
             end
    
    size = (response.body.bytesize / 1024.0).round(1)
    puts "#{status.ljust(25)} #{path.ljust(25)} (#{size}KB)"
    
    return { success: response.code.to_i == expected_status, response: response }
  rescue => e
    puts "💥 ERROR   #{path.ljust(25)} #{e.class}: #{e.message}".red
    return { success: false, error: e.message }
  end
end

def test_api_swap_claim
  begin
    uri = URI("#{BASE_URL}/api/swaps/2001/claim")
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = TIMEOUT
    http.read_timeout = TIMEOUT
    req = Net::HTTP::Post.new(uri.request_uri)
    req['Content-Type'] = 'application/json'
    
    response = http.request(req)
    
    if response.code == '200'
      puts "🔒 API CLAIM #{'/api/swaps/2001/claim'.ljust(25)} ✅ LIVE".green
      return true
    else
      puts "🔒 API CLAIM #{'/api/swaps/2001/claim'.ljust(25)} ❌ #{response.code}".red
      return false
    end
  rescue => e
    puts "🔒 API CLAIM ❌ #{e.message}".red
    false
  end
end

def test_devise_login
  begin
    uri = URI("#{BASE_URL}/users/sign_in")
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = TIMEOUT
    http.read_timeout = TIMEOUT
    req = Net::HTTP::Post.new(uri.request_uri)
    req.set_form_data('user[email]' => 'tech@thomasit.com', 'user[password]' => 'ThomasIT2026!')
    
    response = http.request(req)
    
    success = response.code == '200' || response['location']&.include?('dashboard')
    status = success ? "✅ AUTH OK".green : "❌ AUTH FAIL (#{response.code})".red
    puts "#{status.ljust(25)} Devise Login (tech@thomasit.com)".light_blue
    
    success
  rescue => e
    puts "🔐 SECURITY  #{'Devise Login'.ljust(25)} ❌ #{e.message}".red
    false
  end
end

def test_performance
  start_time = Time.now
  10.times { test_endpoint('/tech') }
  avg_time = ((Time.now - start_time) / 10 * 1000).round(0)
  
  perf = avg_time < 200 ? "⚡ FAST".green : avg_time < 500 ? "⚠️  OK".yellow : "🐌 SLOW".red
  puts "\n🚀 PERFORMANCE: #{perf} (#{avg_time}ms avg /tech)".light_cyan
end

puts "🧪 THOMAS IT NETWORK SWAP - COMPREHENSIVE TEST SUITE".bold.yellow
puts "=" * 70

puts "\n📄 DASHBOARD PAGES:"
results = [
  test_endpoint('/'),
  test_endpoint('/tech'),
  test_endpoint('/enterprise'), 
  test_endpoint('/dispatch'),
  test_endpoint('/eol_swaps'),
  test_endpoint('/inventory')
]

puts "\n🔌 API ENDPOINTS:"
api_results = [
  test_api_swap_claim,
  test_endpoint('/api/devices', 200),
  test_endpoint('/api/swaps', 200)
]

puts "\n🔐 SECURITY:"
auth_results = [test_devise_login]

test_performance

total_pass = results.select{|r| r[:success] }.count + 
             api_results.select{|r| r }.count + 
             auth_results.select{|r| r }.count

total_tests = results.count + api_results.count + auth_results.count
pass_rate = (total_pass.to_f / total_tests * 100).round(1)

puts "\n" + "=" * 70
puts "🎯 SUMMARY: #{total_pass}/#{total_tests} (#{pass_rate}%)".send(pass_rate >= 90 ? :green : pass_rate >= 80 ? :yellow : :red)
puts "🌐 LOCAL:  http://localhost:3000/tech".cyan
puts "☁️  PROD: https://network-swap-app.onrender.com/tech".cyan
puts "\n✅ READY FOR PRODUCTION" if pass_rate >= 90
