Rails.application.routes.draw do
  root to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>🚀 Network Swap LIVE</h1><p>Thomas IT Pharma Dashboard Phase 4 ✅</p>"]] }
  get "/health", to: proc { [200, {"Content-Type" => "text/plain"}, ["OK"]] }
  get "/dashboard", to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Dashboard</h1><p>Your Tailwind UI here</p>"]] }
end
