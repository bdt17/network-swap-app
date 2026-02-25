Rails.application.routes.draw do
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'
  get 'session/new', to: 'sessions#new'
  post 'session', to: 'sessions#create'
  delete 'session', to: 'sessions#destroy'
  get 'health', to: proc { [200, {}, ['OK']] }
  get '/api/devices', to: 'api#devices'
  get '/api/shipments', to: 'api#shipments'
  get 'tech', to: 'public#tech'

  # PHASE 14 DRONE ROUTES - CORRECTLY INSIDE DRAW BLOCK
  namespace :api do
    namespace :v1 do
      get '/drone_fleets/:fleet_id/inspect', to: 'drone#inspect'
    end
  end
end
