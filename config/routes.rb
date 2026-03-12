Rails.application.routes.draw do
  root 'dashboard#index'

  # Dashboard routes
  get '/tech', to: 'dashboard#tech'
  get '/dashboard/tech', to: 'dashboard#tech'
  get '/dashboard', to: 'dashboard#index'

  # NetworkSwap Core Features
  resources :networks, only: [:index, :show] do
    collection do
      get :status
    end
  end

  resources :devices, only: [:index, :show] do
    member do
      get :health
      post :update_status
    end
  end

  resources :swaps, only: [:index, :new, :create, :show] do
    member do
      post :claim
      get :status
    end
  end

  # API routes - NAMESPACED (FIXED)
  namespace :api do
    get '/dispatch_sms', to: 'dispatch#sms'
    post '/dispatch_sms', to: 'dispatch#sms'  # Added POST version
    
    resources :devices, only: [:index, :show] do
      member do
        get :health
      end
    end

    resources :swaps, only: [:index, :create] do
      member do
        post :claim
      end
    end

    get '/devices/export.csv', to: 'devices#export'
    get '/status', to: 'status#index'
  end

  # Devise Auth (if using)
  # devise_for :users

  # Health check
  get '/health', to: proc { [200, {}, ['OK']] }
end

  post '/api/dispatch_sms', to: 'api/dispatch#sms'
