Rails.application.routes.draw do
  resources :dashboard, only: [:index] do
    get :tech, on: :collection
    get :ar, on: :collection
  end

  namespace :api do
    resources :devices do
      get :health, on: :member
      get :export, on: :collection, defaults: {format: 'csv'}
      post 'dispatch_sms', to: 'dispatch#sms'
    end
    resources :swaps, only: [:index]
    
    # Phase 8B SMS Dispatch - ENTERPRISE LIVE
    post 'dispatch_sms', to: 'dispatch#sms'
    get 'drones', to: 'drones#index'
    get 'status', to: 'status#index'
  end

  root 'dashboard#index'
  get '/login', to: 'sessions#new'
  get '/devices', to: 'devices#index'
  get '/drones', to: 'drones#index'
  get '/network', to: 'network#index'
  get '/health', to: proc { [200, {}, ['OK']] }
end
