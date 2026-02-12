Rails.application.routes.draw do
  get '/health', to: -> (env) { [200, {'Content-Type' => 'text/plain'}, ['OK']] }
  
  # EXACT MATCH your local: api_swaps GET/POST /api/swaps
  resources :swaps, path: 'api/swaps' do
    member do
      post :claim
    end
  end
  
  # Pages (your local routes)
  get '/tech', to: 'pages#tech'
  get '/dispatch', to: 'pages#dispatch'
  get '/enterprise', to: 'pages#enterprise'
  get '/eol_swaps', to: 'pages#eol_swaps'
  get '/inventory', to: 'pages#inventory'
  
  root to: 'pages#tech'
end
