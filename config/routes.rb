Rails.application.routes.draw do
  root to: 'dashboard#index'
  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#destroy', as: :logout
  get '/tech', to: 'dashboard#tech', as: :tech
  post '/login', to: 'sessions#create'
end
