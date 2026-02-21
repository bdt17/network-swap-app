Rails.application.routes.draw do
  root 'dashboard#index'

  # Login flow
  get  '/session/new',  to: 'sessions#new',    as: :login
  post '/session',      to: 'sessions#create', as: :session
  delete '/session',    to: 'sessions#destroy'

  # Network swap pages
  get '/dashboard',   to: 'dashboard#index'
  get '/tech',        to: 'dashboard#tech'
  get '/enterprise',  to: 'dashboard#enterprise'
  get '/eol_swaps',   to: 'dashboard#eol_swaps'
  get '/inventory',   to: 'inventory#index'

  # API
  namespace :api do
    resources :devices, only: [:index]
  end
end
