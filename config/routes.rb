Rails.application.routes.draw do
  root "home#index"
  get "health", to: ->(env) { [200, {"Content-Type" => "application/json"}, ["OK"]] }
  get "inventory", to: ->(env) { [200, {"Content-Type" => "application/json"}, ["Inventory LIVE"]] }
  
  # Simple API routes
  get '/api/devices', to: 'api/devices#index'
  get '/api/devices/1/ai_recommend', to: 'ai_recommend#show'
  get '/api/audit_logs', to: 'api/audit_logs#index'
end
