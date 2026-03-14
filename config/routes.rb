Rails.application.routes.draw do
  root to: "home#index"
  get 'tech', to: 'home#tech'
  get 'dashboard', to: 'home#dashboard'
  get 'ar', to: 'ar_overlay#index'

  # DJI Cloud API 180694
  namespace :api do
    get 'health', to: 'main#health'
    get 'drones/fleet', to: 'main#fleet'
    get 'drones/:id/inspect', to: 'main#inspect'
    get 'drones/:id/control', to: 'main#control'
    get 'devices/export', to: 'main#export'
    post 'dispatch_sms', to: 'main#sms'
  end

  # Auth (test mock)
  get 'session/new', to: 'sessions#new'
  post 'session', to: 'sessions#create'
  delete 'session', to: 'sessions#destroy'
end
