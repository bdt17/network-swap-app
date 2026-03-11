Rails.application.routes.draw do
  # Dashboard routes
  resources :dashboard, only: [:index] do
    get :tech, on: :collection
    get :ar, on: :collection
  end

  # API namespace - Phase 8B SMS
  namespace :api do
    resources :devices do
      get :health, on: :member
      get :export, on: :collection, defaults: {format: 'csv'}
    end
    post 'dispatch_sms', to: 'dispatch#sms'
    resources :swaps, only: [:index]
    get 'drones', to: 'drones#index'
    get 'status', to: 'status#index'
  end

  # Root + pages
  root 'dashboard#index'
  get '/login', to: 'sessions#new'
  get '/health', to: proc { [200, {}, ['OK']] }
end
