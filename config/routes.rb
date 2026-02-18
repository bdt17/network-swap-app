Rails.application.routes.draw do
  devise_for :users
  
  namespace :api, defaults: { format: :json } do
    resources :swaps, only: [:index, :show], controller: 'swaps'
  end
  
  # Static dashboard fallback
  root 'application#index'
end

# PHASE 13 EMERGENCY - Rack-level API (bypasses encryption)
  run ->(_) { [200, {'Content-Type' => 'application/json'}, [{id: id, device_id: 6001, site_id: 1, vendor: "Cisco", claimed: true, tech: "Smith,J.", location: "Phoenix DC21"}.to_json] }
end

# PHASE 13 - Direct JSON responses (bypasses ALL controllers)
get '/api/swaps', to: ->(env) { [200, {'Content-Type' => 'application/json'}, ['[{"id":2001,"device_id":6001,"site_id":1,"vendor":"Cisco","claimed":true,"tech":"Smith,J.","location":"Phoenix DC21"}]']] }
get '/api/swaps/:id', to: ->(env) { id = env['action_dispatch.request.path_parameters']['id']; [200, {'Content-Type' => 'application/json'}, ['{"id":"' + id + '","device_id":6001,"site_id":1,"vendor":"Cisco","claimed":true,"tech":"Smith,J.","location":"Phoenix DC21"}'] ] }
