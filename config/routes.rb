Rails.application.routes.draw do
  root 'dashboard#index'
  get 'session/new', to: 'sessions#new'
  post 'session', to: 'sessions#create'
  delete 'session', to: 'sessions#destroy'
end
