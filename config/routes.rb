Rails.application.routes.draw do
  root to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Network Swap App LIVE</h1>"]] }
  get "/health", to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Network Swap App Healthy</h1><p>Phase 4 ✅ LIVE</p>"]] }
  get "/dashboard", to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Dashboard LIVE</h1><p>Your Tailwind UI goes here</p>"]] }
end
