Rails.application.routes.draw do
  # Devise (login)
  devise_for :users
  
  # Public dashboard (Phase 4 MVP)
  root 'dashboard#index'
  
  # Inventory (fixes 500 error)
  get '/inventory', to: 'inventory#index'
  
  # API namespace
  namespace :api do
    namespace :v1 do
      post '/inspections', to: 'inspections#create'
    end
  end
  
  # Health check
  get '/health', to: proc { [200, {}, ['OK']] }
end
