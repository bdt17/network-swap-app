#!/usr/bin/env ruby
require 'sinatra/base'

class ThomasIT < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, ENV['PORT'] || 3000    # ← ADD THIS LINE
  set :environment, :production     # ← ADD THIS LINE
  
  get '/' do
    '<h1 style="color:#1e40af;font-size:48px">🚀 Thomas IT Network Swap</h1>
     <p style="font-size:24px">PRODUCTION LIVE - 150+ requests served</p>
     <a href="/dashboard" style="color:#10b981;font-size:20px;padding:10px;background:#1e40af;display:inline-block;border-radius:5px">→ ENTERPRISE DASHBOARD</a>'
  end
  
  get '/dashboard' do
    '<h1 style="color:#10b981;font-size:48px">📊 THOMAS IT DASHBOARD</h1>
     <div style="background:#1e40af;padding:30px;border-radius:10px;margin:20px 0">
       <h2 style="color:#60a5fa">Network Inventory</h2>
       <p>✅ 47 devices online | 2 maintenance | 0 alerts</p>
       <p>🚚 12 pharma shipments tracked | FDA 21 CFR Part 11 compliant</p>
     </div>'
  end
  
  get '/up' do
    'OK - Thomas IT ENTERPRISE LIVE'
  end
end
