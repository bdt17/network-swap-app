Rails.application.routes.draw do
  # Static pages
  get '/tech', to: 'pages#tech'
  get '/dispatch', to: 'dispatch#index'
  get '/enterprise', to: 'pages#enterprise'
  get '/eol_swaps', to: 'pages#eol_swaps'
  get '/inventory', to: 'pages#inventory'

  # API endpoints  
  post '/api/swaps', to: 'api/swaps#create'
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'

  # Root
  root 'pages#tech'
end
