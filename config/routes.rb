Rails.application.routes.draw do
  # ========================================
  # CORE ROUTES - FIXED FOR PRODUCTION
  # ========================================
  root to: "dashboard#index"
  
  # FIXED: Sessions (plural) - Rails 8.1.2 RESTful standard
  resources :sessions, only: [:new, :create] do
    collection do
      delete :destroy  # DELETE /sessions (logout)
    end
  end

  get "/tech", to: "dashboard#tech", as: :tech

  # PHASE 14 DRONE API (WORKING ✅ DJI-PHX-179)
  namespace :api do
    namespace :v1 do
      post "/inspections", to: "inspections#create"
    end
  end

  # ActionCable WebSocket (inside routes - FIXED)
  mount ActionCable.server => '/cable'

  # Controllers MUST exist (Phase 13 stubs)
  get "/dashboard", to: "dashboard#index"
end
