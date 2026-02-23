Rails.application.routes.draw do
  root to: 'dashboard#index'
  get '/login', to: 'sessions#new'
  get '/tech', to: 'dashboard#tech'
  resources :sessions, only: [:create, :destroy]
end
