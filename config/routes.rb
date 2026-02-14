Rails.application.routes.draw do
  # API Endpoints
  namespace :api do
    get '/devices', to: 'devices#index'
    get '/dispatch', to: 'dispatch#index'
    get '/swaps', to: 'swaps#index'
  end

  # Health check
  get '/health', to: -> (env) { [200, {'Content-Type' => 'text/plain'}, ['OK']] }

  # Thomas IT pages
  root to: proc { [200, {}, ['Thomas IT Network Swap API v1.0']] }
  get '/tech', to: 'pages#tech'

  # Swap tickets API (existing)
  resources :swaps, path: 'api/swaps' do
    member do
      post :claim
    end
  end
end
