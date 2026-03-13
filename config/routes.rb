Rails.application.routes.draw do
  root to: "home#index"
  
  namespace :api, defaults: {format: :json} do
    resources :devices, only: [:index]
    resources :swaps do
      member do
        post :claim
      end
    end
    
    # PHASE 13/14 DRONE APIs
    namespace :drones do
      get :fleet
      get ':id/inspect'
      get ':id/diagnostics'
      get 'swarm/status'
    end
    
    namespace :firmware do
      get ':id/status'
    end
    
    get :health, to: 'health#show'
    post '/notifications/sms', to: 'notifications#sms'
  end
end
