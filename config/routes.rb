Rails.application.routes.draw do
  get "health/show"
  get "dashboard/index"
  get "dashboard/tech"
  root 'dashboard#index'
  
  # Tech Dashboard + DJI Drone
  get '/tech', to: 'dashboard#tech'
  
  # API - DJI Drone (LIVE!)
  namespace :api do
    namespace :v1 do
      post '/inspections', to: 'inspections#create'  # ✅ WORKING
    end
  end
  
  # Health check
  get '/health', to: 'health#show'
end
