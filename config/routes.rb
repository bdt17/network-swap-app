Rails.application.routes.draw do
  # FIELD TECH ROUTES (No Auth Required)
  get '/', to: 'home#index'
  get '/tech', to: 'tech#index'
  get '/dashboard', to: 'dashboard#index'
  get '/enterprise', to: 'enterprise#index'
  get '/eol_swaps', to: 'eol_swaps#index'
  get '/inventory', to: 'inventory#index'
  
  # APIs (No Auth)
  get '/api/devices', to: 'api#devices'
  get '/api/shipments', to: 'api#shipments'
  
  # DISABLE DEVise routes completely
  # get '/users/sign_in', to: 'home#index'  # Redirect to landing
end
