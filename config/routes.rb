Rails.application.routes.draw do
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'session/new', to: 'sessions#new', as: 'session_new'
  post 'session', to: 'sessions#create'
  delete 'session', to: 'sessions#destroy'
  get 'health', to: proc { [200, {}, ['OK']] }
  get 'api/devices', to: 'api#devices'
  get 'api/shipments', to: 'api#shipments'
end

# Thomas IT Network Swap - Production Routes
get '/tech', to: 'pages#tech'
get '/dispatch', to: 'pages#dispatch'
get '/enterprise', to: 'pages#enterprise' 
get '/health', to: 'health#index'
get '/api/swaps', to: 'api/swaps#index', defaults: { format: :json }
get '/api/swaps/:id/claim', to: 'api/swaps#claim', defaults: { format: :json }

# Thomas IT Network Swap - Production Routes (REAL controllers)
get '/tech', to: 'public#tech'           # public_controller.rb
get '/dispatch', to: 'dispatch#index'    
get '/enterprise', to: 'public#enterprise'
get '/health', to: 'health#index'        
namespace :api do
  namespace :v1 do
    resources :swaps  # Uses api/v1/swaps_controller.rb
  end
end
