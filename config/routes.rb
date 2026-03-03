# config/routes.rb
Rails.application.routes.draw do
  get '/api/analytics/dashboard', to: 'api/analytics#dashboard'

  # STATIC PAGES (your perfect TailwindCSS designs)
  get '/', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]] }

  # Dashboard and inventory (same page, different routes)
  get '/dashboard', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/dashboard.html')]] }
  get '/inventory', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/inventory.html')]] }

  # Sites / enterprise routes
  get '/sites',      to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/sites.html')]] }
  get '/enterprise', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/enterprise.html')]] }

  # Field techs
  get '/field_techs', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/field_techs.html')]] }

  # EOL swaps
  get '/eol_swaps', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/eol_swaps.html')]] }

  # Tech / field ops
  get '/tech', to: proc { [200, {}, ['Thomas IT Tech Dashboard - Field Ops Ready']] }

  # APIs (already working perfectly)
  get '/health', to: proc { [200, {}, ['OK']] }

  get '/api/devices', to: 'api#devices'

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
  mount ActionCable.server => '/cable'
end
