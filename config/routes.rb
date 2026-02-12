Rails.application.routes.draw do
  get 'tech', to: 'pages#tech'
  get 'dispatch', to: 'dispatch#index'
  get 'enterprise', to: 'pages#enterprise'
  get 'eol_swaps', to: 'pages#eol_swaps'
  get 'inventory', to: 'pages#inventory'
  root to: 'pages#tech'

  # API Routes
  get '/api/swaps', to: 'api/swaps#index'
  post '/api/swaps', to: 'api/swaps#create'
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'
  get '/health', to: ->(env) { [200, {'Content-Type' => 'application/json'}, ['{"status":"ok"}']] }
end
