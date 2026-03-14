Rails.application.routes.draw do
  get '/api/health', to: 'api#health'
  get '/api/drones/fleet', to: 'api#fleet'  
  get '/api/drones/:id/inspect', to: 'api#inspect'
  get '/api/drones/:id/control', to: 'api#control'
  get '/api/devices/export', to: 'api#export'
  get '/api/dispatch_sms', to: 'api#sms'  # Test uses GET
  
  get '/session/new', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  
  # Frontend routes already work 100%
  root 'home#index'
  get 'tech', to: 'home#tech'
  get 'dashboard', to: 'home#dashboard'
  get 'ar', to: 'ar_overlay#index'
end
