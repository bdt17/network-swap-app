Rails.application.routes.draw do
  root 'application#index'
  
  get '/tech', to: 'tech#index'
  get '/dashboard', to: 'dashboard#index'
  get '/enterprise', to: 'enterprise#index'
  get '/eol_swaps', to: 'eol_swaps#index'
  get '/inventory', to: 'inventory#index'
  
  get '/api/devices', to: 'api#devices'
  get '/api/shipments', to: 'api#shipments'
end
