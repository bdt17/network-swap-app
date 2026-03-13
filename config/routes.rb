Rails.application.routes.draw do
  root to: "home#index"
  
  namespace :api, defaults: {format: :json} do
    # Phase 14 - SIMPLE FLAT ROUTES
    get 'devices', to: 'devices#index'
    get 'drones/fleet', to: 'drones#fleet'
    get 'drones/:id/inspect', to: 'drones#inspect'
    get 'drones/:id/diagnostics', to: 'drones#diagnostics'
    get 'drones/swarm/status', to: 'drones#swarm_status'
    get 'firmware/:id/status', to: 'firmware#status'
    get 'health', to: 'health#show'
  end
end
