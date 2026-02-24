Rails.application.routes.draw do
  root 'dashboard#index'
  
  resources :techs
  get '/tech', to: 'techs#index'
  
  # Thomas IT Login Routes
  get 'session/new', to: 'sessions#new'
  post 'session', to: 'sessions#create'
  delete 'session', to: 'sessions#destroy'
end
