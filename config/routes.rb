Rails.application.routes.draw do
  # FIELD TECH ROUTES (Priority 1)
  root 'application#index'
  get '/tech', to: 'tech#index'
  get '/dashboard', to: 'dashboard#index'
  get '/enterprise', to: 'enterprise#index'
  get '/eol_swaps', to: 'eol_swaps#index'
  get '/inventory', to: 'inventory#index'
  get '/dispatch', to: 'dispatch#index'
  
  # FIELD APIs
  get '/api/devices', to: 'api#devices'
  get '/api/shipments', to: 'api#shipments'
  
  # CATCH-ALL: Redirect ANY 500/404 → Landing page
  match '*path', to: 'application#index', via: :all, constraints: lambda { |req| req.path =~ %r{^(users|devise|sign_in|sign_out)} }
end
