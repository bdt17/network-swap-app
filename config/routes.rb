Rails.application.routes.draw do
  root to: proc { [200, {"Content-Type" => "text/html"}, ["<h1>Network Swap App LIVE</h1>"]] }
  get "/health", to: proc { [200, {"Content-Type" => "text/plain"}, ["OK"]] }
  get "/dashboard", to: proc { [200, {"Content-Type" => "text/html"}, [File.read("public/index.html") rescue "<h1>Dashboard</h1>"]] }
end
