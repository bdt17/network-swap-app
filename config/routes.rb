Rails.application.routes.draw do
  # Dashboard & AR routes
  resources :dashboard, only: [:index] do
    get :tech, on: :collection
    get :ar, on: :collection
  end

  # API namespace - Phase 8B SMS + Devices
  namespace :api do
    resources :devices do
      get :health, on: :member
      get :export, on: :collection, defaults: {format: 'csv'}
    end
    
    # Phase 8B: Twilio SMS Dispatch (SINGLE route)
    post 'dispatch_sms', to: 'dispatch#sms'
    
    resources :swaps, only: [:index]
    get 'drones', to: 'drones#index'
    get 'status', to: 'status#index'
  end

  # Legacy pages (Phase 7)
  root 'dashboard#index'
  get '/login', to: 'sessions#new'
  get '/devices', to: 'devices#index'
  get '/drones', to: 'drones#index'
  get '/network', to: 'network#index'
  
  # Health check
  get '/health', to: proc { [200, {}, ['OK']] }
end

  post '/api/dispatch_sms', to: 'api/dispatch#sms'
