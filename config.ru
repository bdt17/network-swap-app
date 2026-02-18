require 'rack'

class Phase13NetworkSwap
  def self.call(env)
    path = env['PATH_INFO']
    
    case path
    when '/' 
      [200, {'Content-Type' => 'text/html'}, ['<h1>Main Dashboard - Thomas IT Network Swap</h1><p>Phase 13 Production Ready - Phoenix DC21</p>']]
    when '/tech'
      [200, {'Content-Type' => 'text/html'}, ['<h1>Tech Dashboard - Phase 8 LIVE</h1><p>Smith,J. - Network Swap Ready</p>']]
    when '/dispatch'
      [200, {'Content-Type' => 'text/html'}, ['<h1>Dispatch Tower - Phase 9 LIVE</h1>']]
    when '/inventory'
      [200, {'Content-Type' => 'text/html'}, ['<h1>Network Inventory LIVE</h1><p>Cisco Devices - Phoenix DC21</p>']]
    when '/eol_swaps'
      [200, {'Content-Type' => 'text/html'}, ['<h1>EOL Swaps Dashboard LIVE</h1>']]
    when '/enterprise'
      [200, {'Content-Type' => 'text/html'}, ['<h1>Enterprise Dashboard LIVE</h1>']]
    when '/api/swaps'
      [200, {'Content-Type' => 'application/json'}, ['[{"id":2001,"device_id":6001,"site_id":1,"vendor":"Cisco","claimed":true,"tech":"Smith,J.","location":"Phoenix DC21"}]']]
    when %r{^/api/swaps/(\d+)}
      id = $1
      [200, {'Content-Type' => 'application/json'}, ['{"id":"' + id + '","device_id":6001,"site_id":1,"vendor":"Cisco","claimed":true,"tech":"Smith,J.","location":"Phoenix DC21"}']]
    else
      [404, {'Content-Type' => 'text/plain'}, ['Not Found - Phase 13 Network Swap']]
    end
  end
end

run Phase13NetworkSwap
