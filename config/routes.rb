Rails.application.routes.draw do
  # Public static dashboard (Phase 5-6)
  root to: -> { [200, {}, ['Thomas IT Network Swap - Phase 7 LIVE']] }
  
  # API Routes (Zero Trust protected)
  namespace :api, defaults: { format: :json } do
    resources :swaps, only: [:index] do
      collection do 
        post :bulk_create
      end
    end
  end
  
  # Legacy routes (keep Phase 5-6 working)
  post '/api/swaps/alert_test', to: 'api/swaps#alert_test'
  post '/api/swaps/bulk_create', to: 'api/swaps#bulk_create'
end
