Rails.application.routes.draw do
  # ========================================
  # PHASE 13+14 CORE (WORKING)
  # ========================================
  root to: "dashboard#index"
  get "/tech", to: "dashboard#tech", as: :tech
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout
  
  # PHASE 14 DRONE API (WORKING)
  namespace :api do
    namespace :v1 do
      post "/inspections", to: "inspections#create"
    end
  end

  # ========================================
  # PHASE 13 STUBS (DISABLED - no syntax errors)
  # ========================================
  # get "/dispatch-tower", to: "dispatch#tower"
  # get "/inventory", to: "devices#index"
  # get "/eol-swaps", to: "swaps#eol"
  # get "/enterprise", to: "sites#index"
  # namespace :api do
  #   namespace :v1 do
  #     resources :swaps, only: [:index, :show, :update]
  #   end
  # end
end
