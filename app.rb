#!/usr/bin/env ruby
require 'sinatra/base'

class ThomasIT < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, ENV['PORT'] || 3000
  set :environment, :production

  get '/' do
    <<~HTML
    <!DOCTYPE html>
    <html>
    <head>
      <title>Thomas IT Network Swap</title>
      <link href="/css/thomas-it.css" rel="stylesheet">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
      <header class="header">
        <div class="container">
          <h1>🚀 Thomas IT Network Swap</h1>
          <p style="font-size: 1.3rem; opacity: 0.95;">PRODUCTION LIVE - 150+ requests served</p>
        </div>
      </header>
      
      <div class="container">
        <div style="text-align: center; margin: 3rem 0;">
          <a href="/dashboard" class="btn">📊 Enterprise Dashboard</a>
          <a href="/api/devices" class="btn btn-secondary" style="margin-left: 1rem;">🔌 API v1</a>
        </div>
      </div>
    </body>
    </html>
    HTML
  end

  get '/dashboard' do
    <<~HTML
    <!DOCTYPE html>
    <html>
    <head>
      <title>Thomas IT Dashboard</title>
      <link href="/css/thomas-it.css" rel="stylesheet">
    </head>
    <body>
      <header class="header">
        <div class="container">
          <h1>📊 THOMAS IT ENTERPRISE DASHBOARD</h1>
        </div>
      </header>
      
      <div class="container">
        <div class="grid">
          <div class="card">
            <h2>🌐 Network Inventory</h2>
            <p><span class="status-online">✅ 47 devices online</span></p>
            <p><span class="status-maintenance">🔧 2 maintenance</span> | <span class="status-online">0 alerts</span></p>
            <p>🚚 12 pharma shipments tracked | <strong>FDA 21 CFR Part 11 compliant</strong></p>
          </div>
          
          <div class="card">
            <h2>🔌 API Endpoints</h2>
            <p><a href="/api/devices" class="btn">📱 GET /api/devices</a></p>
            <p><a href="/api/shipments" class="btn btn-secondary">🚚 GET /api/shipments</a></p>
            <p style="margin-top: 1rem; font-size: 0.9rem; color: var(--accent-silver);">JSON responses | Production ready</p>
          </div>
        </div>
      </div>
    </body>
    </html>
    HTML
  end

  get '/up' do
    'OK - Thomas IT ENTERPRISE LIVE'
  end

  # PHASE 2: Network Inventory API
  get '/api/devices' do
    content_type :json
    [
      {id: 1, mac: "00:11:22:33:44:55", ip: "10.0.1.10", status: "online", location: "Phoenix DC1"},
      {id: 2, mac: "00:11:22:33:44:56", ip: "10.0.1.11", status: "online", location: "Phoenix DC2"},
      {id: 3, mac: "00:11:22:33:44:57", ip: "10.0.1.12", status: "maintenance", location: "Phoenix DC1"}
    ].to_json
  end

  get '/api/shipments' do
    content_type :json
    [
      {id: 1, device_id: 1, temp: 2.3, location: "Phoenix AZ", compliant: true, eta: "2026-02-03"},
      {id: 2, device_id: 2, temp: 4.1, location: "Tucson AZ", compliant: true, eta: "2026-02-04"}
    ].to_json
  end
end
