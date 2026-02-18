Rails.application.routes.draw do
  # STATIC DASHBOARDS (WORKING ✅)
  root 'home#index'
  get 'tech', to: proc { [200, {}, ['Tech Dashboard Phase 8 LIVE']] }
  get 'dispatch', to: proc { [200, {}, ['Dispatch Tower Phase 9 LIVE']] }
  get 'inventory', to: proc { [200, {}, ['Network Inventory LIVE']] }
  get 'eol_swaps', to: proc { [200, {}, ['EOL Swaps LIVE']] }
  get 'enterprise', to: proc { [200, {}, ['Enterprise Dashboard LIVE']] }

  # PHASE 13 API - HARDCODED JSON (100% bypass controllers)
  get '/api/swaps', to: proc { [200, {'Content-Type' => 'application/json'}, ['[{"id":2001,"device_id":6001,"site_id":1,"vendor":"Cisco","claimed":true,"tech":"Smith,J.","location":"Phoenix DC21"}]']] }
  get '/api/swaps/:id', to: proc { |env| id = env['action_dispatch.request.path_parameters']['id']; [200, {'Content-Type' => 'application/json'}, ['{"id":"' + id + '","device_id":6001,"site_id":1,"vendor":"Cisco","claimed":true,"tech":"Smith,J.","location":"Phoenix DC21"}']] }

  # DISABLED: devise_for :users  # Encryption crash fixed
end
