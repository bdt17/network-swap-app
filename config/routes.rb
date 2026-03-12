# config/routes.rb

Rails.application.routes.draw do
  root 'dashboard#index'

  get '/tech', to: 'dashboard#tech'

  # SMS dispatch endpoint
  post '/api/dispatch_sms', to: 'api/dispatch#sms'

  # Example: add any other routes below
  # get '/about', to: 'pages#about'
  # resources :users
end

  namespace :drones do
    get 'fleet', to: 'drones#fleet'
    get ':id/inspect', to: 'drones#inspect'
    get ':id/diagnostics', to: 'drones#diagnostics'
    get 'swarm/status', to: 'drones#swarm'
  end
  
  namespace :firmware do
    get ':id/status', to: 'firmware#status'
  end
  get 'health', to: 'health#show'
