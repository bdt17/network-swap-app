Rails.application.routes.draw do
  # Landing - Thomas IT Network Portal
  root to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Thomas IT Network Swap Portal</h1><p>Network Inventory Management</p>"]] }
  
  # Health check (plain text)
  get "/health", to: proc { [200, {"Content-Type" => "text/plain"}, ["OK"]] }
  
  # Dashboard (separate endpoint)
  get "/dashboard", to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Network Dashboard</h1><p>Swap Tickets • Device Inventory • Sites</p>"]] }
  
  # Phase 6 API stubs (JSON)
  namespace :api do
    get "/devices", to: proc { [200, {"Content-Type" => "application/json"}, [{devices: []}.to_json]] }
    get "/swaps", to: proc { [200, {"Content-Type" => "application/json"}, [{swaps: []}.to_json]] }
  end
end
