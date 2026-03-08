Rails.application.routes.draw do
  # SESSION ROUTES
  resource :session, only: [:new, :create, :destroy], path: 'session'

  # HEALTH CHECKS
  get "health", to: ->(_) { [200, {}, ["OK"]] }
  get "up", to: "rails/health#show"

  # STATIC PAGES (Phase 8B LIVE)
  get '/', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]] }
  get '/dashboard', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/dashboard.html')]] }
  get '/status', to: 'status#index'
  get '/tech', to: proc { [200, {}, ['Thomas IT Tech Dashboard - Field Ops Ready']] }

  # APIs (Phase 8B PRODUCTION ✅)
  get '/api/devices', to: 'api#devices'
  get '/api/swaps', to: 'api#swaps'
  post '/api/swaps/:id/claim', to: 'api#claim_swap'
  post '/api/dispatch_sms', to: 'status#dispatch_sms'

  # DRONE APIs (Phase 9 Swarm)
  get '/drone/inspect/:id', to: 'drone#inspect'
  get '/api/drone/status', to: 'drone#status'
  post '/api/drone/launch_swarm', to: 'drone#launch_swarm'

  # Phase 9 Live Dashboard
  get '/drone-live', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/drone-live.html')]] }
end
  get '/api/devices/:id/health', to: 'api/devices#health'
  get '/api/devices/export.csv', to: 'api/devices#export'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
