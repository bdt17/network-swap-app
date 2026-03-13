Rails.application.routes.draw do
  root to: "home#index"
  
  namespace :api, defaults: {format: :json} do
    resources :devices, only: [:index]
    
    resources :swaps do
      member do
        post :claim
      end
    end
    
    # FIXED Phase 14 Drone APIs
    namespace :drones do
      get 'fleet', to: 'drones#fleet'
      get ':id/inspect', to: 'drones#inspect'
      get ':id/diagnostics', to: 'drones#diagnostics'
      get 'swarm/status', to: 'drones#swarm_status'
    end
    
    namespace :firmware do
      get ':id/status', to: 'firmware#status'
    end
    
    get 'health', to: 'health#show'
    post '/notifications/sms', to: 'notifications#sms'
  end
end
