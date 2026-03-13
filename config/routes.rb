Rails.application.routes.draw do
  root to: "home#index"
  get 'tech', to: 'home#tech'
  get 'ar', to: 'ar_overlay#index'

    
    post 'dispatch_sms', to: 'main#sms'
    get 'health', to: 'main#show'
    get 'drones/:id/control', to: 'drones#control'
  end
end


  namespace :api do
    get "/health", to: "main#health"
    get "/drones/fleet", to: "main#fleet"
    get "/drones/:id/inspect", to: "main#inspect" 
    get "/drones/:id/control", to: "main#control"
    get "/devices/export", to: "main#export"
    post "/dispatch_sms", to: "main#sms"
  end
