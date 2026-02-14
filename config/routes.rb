devise_for :users
devise_for :users

root to: "devise/sessions#new"
Rails.application.routes.draw do
  devise_for :users
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
namespace :api do\n  resources :swaps\nend

devise_for :users
get 'dashboard', to: 'dashboard#index'
root to: redirect('/users/sign_in')

devise_for :users
get 'dashboard', to: 'dashboard#index'
root to: redirect('/users/sign_in')

get 'dashboard', to: 'dashboard#index'
