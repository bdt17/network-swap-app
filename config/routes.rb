# config/routes.rb - COMPLETE FIXED VERSION
Rails.application.routes.draw do
  get "dashboard/index"
  root "dashboard#index"

  # Static MVP pages
  get "dashboard", to: "dashboard#index"
  get "devices", to: "devices#index"  
  get "sites", to: "sites#index"
  get "swaps", to: "swaps#index"

  # Favicon - SINGLE route only (no duplicates)
  get 'favicon.ico', to: proc { [204, {}, []] }

  # API endpoints (Phase 4-7 LIVE)
  namespace :api do
    get "swaps/index"
    get "swaps/create"
    get "swaps/bulk_create"
    get "swaps/show"
    get "swaps/update"
    get "status", to: "status#index"
    resources :devices, only: [:index]
    get "drones", to: "drones#index"
    resources :drones, only: [:index, :create] # Phase 14
    resources :sites, only: [:index]
    resources :swap_tickets, only: [:index, :create] do
      member do
        get :ar_overlay          # Phase 10
        get :timeline            # Phase 15
        post :butterfly_effect   # Phase 15
      end
    end
  end

  # WebSocket for real-time (Phase 6+)
  mount ActionCable.server => '/cable'

  # Catch-all for static assets/SPA fallback
  get '*path', to: 'static#index' unless Rails.env.development?
end
