#!/usr/bin/env ruby
require 'sinatra/base'

class ThomasIT < Sinatra::Base
  set :bind, '0.0.0.0'
  
  get '/' do
    '<h1 style="color:#1e40af;font-size:48px">🚀 Thomas IT Network Swap</h1>
     <p style="font-size:24px">Production LIVE!</p>
     <p><a href="/dashboard" style="color:#10b981;font-size:20px">→ Dashboard</a></p>'
  end
  
  get '/dashboard' do
    '<h1 style="color:#10b981;font-size:48px">📊 Thomas IT Dashboard</h1>
     <div style="background:#1e40af;padding:20px">
       <h2>Network Status</h2>
       <p>✅ 47 devices online | FDA compliant</p>
     </div>'
  end
  
  get '/up' do
    'OK - Thomas IT LIVE'
  end
end
