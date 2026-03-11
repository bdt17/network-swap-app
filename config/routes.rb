Rails.application.routes.draw do
  resources :dashboard, only: [:index] do
    get :tech, on: :collection
    get :ar, on: :collection
  end

  namespace :api do
    get "dji/telemetry", to: "dji#telemetry"
    resources :devices do
      get :health, on: :member
      get :export, on: :collection, defaults: {format: 'csv'}
    end
    resources :swaps, only: [:index]
    
    # Phase 8B SMS Dispatch - ENTERPRISE LIVE
    get 'drones', to: 'drones#index'
    get 'status', to: 'status#index'
  end

  root 'dashboard#index'
  get '/login', to: 'sessions#new'
  get '/devices', to: 'devices#index'
  get '/drones', to: 'drones#index'
  get '/network', to: 'network#index'
  get '/health', to: proc { [200, {}, ['OK']] }
  get '/api/dispatch_sms', to: 'dispatch#sms'
end
