Rails.application.routes.draw do
  root to: "dashboard#index"
  
  # FIXED: Match test_login_flow.sh expectations (singular 'session')
  get "/session/new", to: "sessions#new"
  post "/session", to: "sessions#create" 
  delete "/session", to: "sessions#destroy"

  get "/dashboard", to: "dashboard#index"
  get "/tech", to: "dashboard#tech", as: :tech

  # PHASE 14 DRONE API (WORKING ✅ DJI-PHX-179)
  namespace :api do
    namespace :v1 do
      post "/inspections", to: "inspections#create"
    end
  end

  mount ActionCable.server => '/cable'
end
