Rails.application.routes.draw do
  get 'tech', to: 'pages#tech'
  get 'dispatch', to: 'dispatch#index'
  get 'enterprise', to: 'pages#enterprise'
  get 'eol_swaps', to: 'pages#eol_swaps'
  get 'inventory', to: 'pages#inventory'
  root to: 'pages#tech'

  namespace :api do
    post '/swaps', to: 'swaps#create'
    post '/swaps/:id/claim', to: 'swaps#claim'
  end
end
