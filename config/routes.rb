Rails.application.routes.draw do
  # Phase 4 MVP - serve your HTML directly
  root to: proc { [200, {}, [File.read("public/index.html")]] }
  get "/dashboard", to: proc { [200, {}, [File.read("public/index.html")]] }
  
  # Phase 6 API stubs
  namespace :api do
    get "devices", to: proc { [200, {"Content-Type" => "application/json"}, [{devices: []}.to_json]] }
    get "swaps", to: proc { [200, {"Content-Type" => "application/json"}, [{swaps: []}.to_json]] }
  end
  
  # Render healthcheck
  get "/health", to: proc { [200, {"Content-Type" => "text/plain"}, ["OK"]] }
end
