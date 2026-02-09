Rails.application.routes.draw do
  # Public dashboard
  root to: -> { [200, {}, ['Thomas IT Network Swap Phase 8 LIVE']] }
  
  # Phase 8 Tech Dashboard
  get '/tech', to: 'tech/dashboard#index'
  post '/tech/claim/:id', to: 'tech/dashboard#claim_ticket', as: 'tech_claim_ticket'
  post '/tech/complete/:id', to: 'tech/dashboard#complete_ticket', as: 'tech_complete_ticket'
  
  # Phase 7 API (Zero Trust)
  namespace :api, defaults: { format: :json } do
    resources :swaps, only: [:index] do
      collection { post :bulk_create }
    end
  end
  
  # Legacy Phase 5-6
  post '/api/swaps/bulk_create', to: 'api/swaps#bulk_create'
end
