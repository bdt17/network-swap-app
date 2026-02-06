Rails.application.routes.draw do
  namespace :api do
    namespace :ai do
      get "phase7/index"
    end
  end
  root "home#index"
  get "health", to: proc { [200, {"Content-Type" => "application/json"}, ["OK"]] }
  get "inventory", to: proc { [200, {"Content-Type" => "application/json"}, ["Inventory LIVE"]] }
  
  get '/api/devices', to: 'api/devices#index'
  get '/api/devices/1/ai_recommend', to: 'ai_recommend#show'
  get '/api/audit_logs', to: 'api/audit_logs#index'
end
namespace :api do
  resources :devices, only: [:index]
  resources :audit_logs, only: [:index]
  namespace :ai do
    namespace :phase7 do
      get 'index'
    end
  end
end
