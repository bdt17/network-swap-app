Rails.application.routes.draw do
  # Static landing (Phase 4)
  root to: "public#index"
  
  # Devise authentication (Phase 5)
  devise_for :users, path: 'session', controllers: { 
    sessions: 'sessions'
  }
  
  # API endpoints (Phase 6)
  namespace :api do
    namespace :v1 do
      get "inspections/index"
      get "inspections/show"
    end
    resources :devices, only: [:index]
  end
  
  # Dashboard (Phase 6)
  get '/dashboard', to: 'swaps#dashboard'
  
  # Health check (Rails 8.1)
  get '/health', to: 'rails/health#show'
end
  get '/drone/inspect', to: 'api/drone#inspect'
  get '/drone/status', to: 'api/drone#status'
