Rails.application.routes.draw do
  root to: "home#index"
  get 'tech', to: 'home#tech'
  get 'ar', to: 'ar_overlay#index'

  namespace :api, defaults: {format: :json} do
    # ALL routes point to main_controller
    resources :devices, only: [] do
      collection { get :index, to: 'main#index' }
      member { get :show, to: 'main#show'; get :health, to: 'main#health' }
      collection { get :export, to: 'main#export' }
    end
    
    get 'drones/fleet', to: 'main#fleet'
    get 'drones/:id/inspect', to: 'main#inspect'
    get 'drones/:id/diagnostics', to: 'main#diagnostics'
    
    post 'dispatch_sms', to: 'main#sms'
    get 'health', to: 'main#show'
  end
end
