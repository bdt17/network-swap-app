Rails.application.routes.draw do
  root "dashboard#index"
  
  # Static MVP pages
  get "dashboard", to: "dashboard#index"
  get "devices", to: "devices#index"  
  get "sites", to: "sites#index"
  get "swaps", to: "swaps#index"
  
  # API endpoints (Phase 4-7 LIVE)
  namespace :api do
    get "status", to: "status#index"
    resources :devices, only: [:index]
    get "drones", to: "drones#index"
  end
  
  # Phase 14 Drones
  namespace :api do
    resources :drones, only: [:index]
  end
end
