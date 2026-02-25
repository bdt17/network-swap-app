Rails.application.routes.draw do
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get 'session/new', to: 'sessions#new'
  post 'session', to: 'sessions#create'
  get 'health', to: proc { [200, {}, ['OK']] }
  get '/api/devices', to: 'api#devices'
  get 'tech', to: 'public#tech'
  get '/drone/inspect/:id', to: 'drone#inspect'
end
