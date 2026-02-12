Rails.application.routes.draw do
  root 'pages#tech'
  
  get 'tech', to: 'pages#tech'
  get 'dispatch', to: 'dispatch#index'
  get 'enterprise', to: 'pages#enterprise'
  get 'eol_swaps', to: 'pages#eol_swaps'
  get 'inventory', to: 'pages#inventory'

  # API (simple + working)
  get '/api/swaps', to: 'swaps#index'
  post '/api/swaps', to: 'swaps#create'
  post '/api/swaps/:id/claim', to: 'swaps#claim'
  get '/health', to: ->(env) { [200, {'Content-Type' => 'application/json'}, ['{"status":"ok"}']] }
end
