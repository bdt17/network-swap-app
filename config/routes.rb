Rails.application.routes.draw do
  devise_for :users
  
  root 'dashboard#index'
  
  get '/inventory', to: 'inventory#index'
  get '/network-inventory', to: 'inventory#network'
  
  namespace :api do
    namespace :v1 do
      post '/inspections', to: 'inspections#create'
      get '/devices', to: -> { [200, {}, ['8 devices online']] }
    end
  end
  
  get '/health', to: proc { [200, {}, ['DJI-PHX-179 LIVE']] }
end
