Rails.application.routes.draw do
  # Health check
  get '/health', to: -> (env) { [200, {'Content-Type' => 'text/plain'}, ['OK']] }

  # API Endpoints - Thomas IT Network Swap
  namespace :api do
    get '/dispatch', to: 'dispatch#index'
    get '/swaps', to: 'swaps#index'
    post '/swaps', to: 'swaps#create'
    get '/swaps/:id', to: 'swaps#show'
    post '/swaps/:id/claim', to: 'swaps#claim'
    get '/devices', to: 'devices#index'
  end

  # Root page
  root to: proc { [200, {}, ['Thomas IT Network Swap API v1.0 - Phoenix DC21']] }
  get '/tech', to: 'pages#tech'
end
