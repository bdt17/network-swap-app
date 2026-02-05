Rails.application.routes.draw do
  root to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Network Swap LIVE ✅</h1>"]] }
  get "/health", to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Healthy ✅</h1>"]] }
  get "/dashboard", to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Dashboard LIVE</h1>"]] }
end
