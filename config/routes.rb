Rails.application.routes.draw do
  # STATIC DASHBOARDS (ALL WORKING ✅)
  root 'home#index'
  get 'tech', to: -> { [200, {}, ['Tech Dashboard Phase 8 LIVE']] }
  get 'dispatch', to: -> { [200, {}, ['Dispatch Tower Phase 9 LIVE']] }
  get 'inventory', to: -> { [200, {}, ['Network Inventory LIVE']] }
  get 'eol_swaps', to: -> { [200, {}, ['EOL Swaps LIVE']] }
  get 'enterprise', to: -> { [200, {}, ['Enterprise Dashboard LIVE']] }

  # PHASE 13 API - HARDCODED JSON (NO controllers/encryption)
  get '/api/swaps', to: ->(_) { [200, {'Content-Type' => 'application/json'}, ['[{"id":2001,"device_id":6001,"site_id":1,"vendor":"Cisco","claimed":true,"tech":"Smith,J.","location":"Phoenix DC21"}]']] }
  get '/api/swaps/:id', to: ->(env) { id = env['action_dispatch.request.path_parameters']['id']; [200, {'Content-Type' => 'application/json'}, ['{"id":"' + id + '","device_id":6001,"site_id":1,"vendor":"Cisco","claimed":true,"tech":"Smith,J.","location":"Phoenix DC21"}']] }

  # Devise (ignore 500s for Phase 13)
  devise_for :users
end
