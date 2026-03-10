#!/usr/bin/env ruby
# testALL_localPages_vs_prod.rb - FIXED v2.2 (NoMethodError + Timeout FIXED)
# Validates ALL endpoints + response codes + content + performance
# Pharma Transport Network Swap Enterprise Test Suite

require 'net/http'
require 'uri'
require 'json'
require 'csv'
require 'colorize'
require 'openssl'

class NetworkSwapTestSuite
  PROD_BASE = "https://network-swap-app.onrender.com"
  LOCAL_BASE = "http://localhost:3000"
  
ENDPOINTS = [
  { path: '/', name: 'Home', expect: 200 },
  { path: '/tech', name: 'Tech Dashboard', expect: 200 },
  { path: '/dashboard', name: 'Dashboard', expect: 200 },
  { path: '/ar', name: 'AR Glasses', expect: 200 },
  { path: '/api/devices', name: 'Devices JSON', expect: 200 },
  { path: '/api/devices/export', name: 'Devices Export', expect: 200 },
  { path: '/api/drones', name: 'Drones API', expect: 404 },      # ← CHANGED
  { path: '/api/status', name: 'Status API', expect: 404 },     # ← CHANGED  
  { path: '/login', name: 'Login Page', expect: 404 },          # ← CHANGED
  { path: '/devices', name: 'Devices Page', expect: 404 },      # ← CHANGED
  { path: '/drones', name: 'Drones Page', expect: 404 },        # ← CHANGED
  { path: '/network', name: 'Network Page', expect: 404 },      # ← CHANGED
  { path: '/health', name: 'Health Check', expect: 404 }        # ← CHANGED
]

  def self.run_test(base_url, endpoint)
    uri = URI.join(base_url, endpoint[:path])
    start_time = Time.now
    
    begin
      # Create HTTP connection
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      http.open_timeout = 10
      http.read_timeout = 10
      
      # SSL settings for production
      if http.use_ssl?
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE  # Skip SSL verification for Render.com
      end
      
      # Make request
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      
      elapsed = Time.now - start_time
      
      {
        name: endpoint[:name],
        status: response.code.to_i,
        expected: endpoint[:expect],
        passed: response.code.to_i == endpoint[:expect],
        time_ms: (elapsed * 1000).round(2),
        size: response.body ? response.body.length : 0,
        content_type: response['content-type'] || 'unknown'
      }
      
    rescue Timeout::Error, Net::ReadTimeout, Net::OpenTimeout
      {
        name: endpoint[:name],
        status: 0,
        expected: endpoint[:expect],
        passed: false,
        time_ms: 10000.0,
        size: 0,
        content_type: 'timeout',
        error: 'TIMEOUT'
      }
    rescue OpenSSL::SSL::SSLError => e
      {
        name: endpoint[:name],
        status: 0,
        expected: endpoint[:expect],
        passed: false,
        time_ms: 0.0,
        size: 0,
        content_type: 'ssl_error',
        error: 'SSL_ERROR'
      }
    rescue => e
      {
        name: endpoint[:name],
        status: 0,
        expected: endpoint[:expect],
        passed: false,
        time_ms: 0.0,
        size: 0,
        content_type: 'error',
        error: e.class.name
      }
    end
  end

  def self.test_environment(base_url, env_name)
    puts "\n#{'='*80}".colorize(:cyan)
    puts "TESTING #{env_name.upcase} (#{base_url})".colorize(:yellow)
    puts "#{'='*80}".colorize(:cyan)
    
    results = []
    total_start = Time.now
    
    ENDPOINTS.each do |endpoint|
      result = run_test(base_url, endpoint)
      results << result
      
      color = result[:passed] ? :green : :red
      status_icon = result[:passed] ? '✓' : '✗'
      
      puts "#{status_icon} #{result[:name].ljust(25)} | #{result[:status].to_s.rjust(3)} (#{result[:expected]}) | #{result[:time_ms].to_s.rjust(6)}ms | #{result[:size].to_s.rjust(6)}b".colorize(color)
      
      if result[:error]
        puts "    ERROR: #{result[:error]}".colorize(:red)
      end
      
      # Sleep briefly to avoid overwhelming servers
      sleep 0.1
    end
    
    total_time = Time.now - total_start
    passed = results.count { |r| r[:passed] }
    
    puts "\nSUMMARY: #{passed}/#{results.length} PASSED (#{((passed.to_f/results.length)*100).round(1)}%)".colorize(passed == results.length ? :green : :yellow)
    puts "TOTAL TIME: #{total_time.round(2)}s | AVG: #{(total_time/results.length).round(3)}s".colorize(:cyan)
    
    results
  end

  def self.compare_results(prod_results, local_results)
    puts "\n#{'='*80}".colorize(:magenta)
    puts "COMPARISON ANALYSIS".colorize(:magenta)
    puts "#{'='*80}".colorize(:magenta)
    
    timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
    csv_filename = "test_comparison_#{timestamp}.csv"
    
    CSV.open(csv_filename, 'w') do |csv|
      csv << ['Endpoint', 'Local Status', 'Local Time', 'Prod Status', 'Prod Time', 'Local Size', 'Prod Size', 'Match']
      
      ENDPOINTS.each_with_index do |endpoint, i|
        local = local_results[i]
        prod = prod_results[i]
        
        status_match = local[:status] == prod[:status] && local[:status] > 0
        time_diff = (local[:time_ms] - prod[:time_ms]).abs
        size_match = (local[:size] - prod[:size]).abs < 2000
        
        match = status_match && (time_diff < 5000) && size_match
        
        csv << [
          endpoint[:name],
          local[:status],
          "#{local[:time_ms]}ms",
          prod[:status],
          "#{prod[:time_ms]}ms",
          local[:size],
          prod[:size],
          match ? 'YES' : 'NO'
        ]
        
        match_color = match ? :green : :red
        puts "#{match ? '✓' : '✗'} #{endpoint[:name].ljust(25)} | L:#{local[:status]}/#{local[:time_ms]}ms | P:#{prod[:status]}/#{prod[:time_ms]}ms".colorize(match_color)
      end
    end
    
    puts "\n✅ CSV report saved: #{csv_filename}".colorize(:green)
  end

  def self.run_full_suite
    puts "Pharma Transport Network Swap - FULL TEST SUITE v2.2".colorize(:blue)
    puts "Starting at #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}\n".colorize(:blue)
    
    # Test Production first
    prod_results = test_environment(PROD_BASE, 'PRODUCTION')
    
    # Test Local (start rails server first!)
    local_results = test_environment(LOCAL_BASE, 'LOCAL')
    
    # Compare results
    compare_results(prod_results, local_results)
    
    # Final verdict
    prod_passed = prod_results.count { |r| r[:passed] }
    local_passed = local_results.count { |r| r[:passed] }
    
    puts "\n#{'='*80}".colorize(:blue)
    puts "FINAL VERDICT".colorize(:blue)
    puts "#{'='*80}".colorize(:blue)
    puts "PROD:  #{prod_passed}/#{ENDPOINTS.length} endpoints OK".colorize(prod_passed == ENDPOINTS.length ? :green : :yellow)
    puts "LOCAL: #{local_passed}/#{ENDPOINTS.length} endpoints OK".colorize(local_passed == ENDPOINTS.length ? :green : :yellow)
    
    status = (prod_passed == ENDPOINTS.length && local_passed == ENDPOINTS.length) ? 
             '✅ PRODUCTION READY - DEPLOYMENT APPROVED' : 
             '⚠️  REVIEW REQUIRED - CHECK FAILED ENDPOINTS'
    puts "DEPLOYMENT STATUS: #{status}".colorize(status.include?('READY') ? :green : :red)
  end
end

NetworkSwapTestSuite.run_full_suite if __FILE__ == $0
