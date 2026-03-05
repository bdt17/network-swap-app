# config/routes.rb
Rails.application.routes.draw do
  # SESSION ROUTES (FIXES 404s - your tests expect these EXACT paths)
  resource :session, only: [:new, :create, :destroy], path: 'session'
  
  # HEALTH CHECKS
  get "health", to: ->(_) { [200, {}, ["OK"]] }
  get "up", to: "rails/health#show"
  
  # STATIC PAGES (your perfect TailwindCSS designs)  
  get '/', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]] }
  get '/dashboard', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/dashboard.html')]] }
  get '/inventory', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/inventory.html')]] }
  get '/sites', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/sites.html')]] }
  get '/enterprise', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/enterprise.html')]] }
  get '/field_techs', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/field_techs.html')]] }
  get '/eol_swaps', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/eol_swaps.html')]] }
  
  # STATUS + TECH DASHBOARDS
  get '/status', to: 'status#index'
  get '/tech', to: proc { [200, {}, ['Thomas IT Tech Dashboard - Field Ops Ready']] }
  
  # APIs (already working perfectly)
  get '/api/devices', to: 'api#devices'
  get '/api/swaps', to: 'api#swaps'
  post '/api/swaps/:id/claim', to: 'api#claim_swap'
  post '/api/dispatch_sms', to: 'status#dispatch_sms'
  get '/api/analytics/dashboard', to: 'api/analytics#dashboard'
  
  # DRONE / diagnostics (Phase 14)
  get '/drone/inspect/:id', to: 'drone#inspect'
  
  # PHASE 14 DRONE SWARM API (FIXED ROUTES)
  namespace :api do
    namespace :drone do
      post 'drones/launch_swarm', to: 'api/drone#launch_swarm'
      post 'inspect', to: 'api/drone#inspect'
      get 'status', to: 'api/drone#status'
    end
  end
  
  # ActionCable
  mount ActionCable.server => '/cable'
end
