Rails.application.routes.draw do
  get "inventory/index"
  get "eol_swaps/index"
  get "enterprise/index"
  get "tech/index"
  # Thomas IT Phase 14/10 routes from your test
  get '/tech', to: 'tech#index'
  get '/enterprise', to: 'enterprise#index'
  get '/eol_swaps', to: 'eol_swaps#index'
  get '/dashboard', to: 'dashboard#index'
  get '/inventory', to: 'inventory#index'
  
  # Missing routes that failed locally too
  get '/sites', to: 'sites#index'
  get '/field_techs', to: 'field_techs#index'
  
  # Default root
  root 'dashboard#index'
end
