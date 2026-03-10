Rails.application.routes.draw do
  # Auth routes (if needed)
  get '/session/new', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'

  # API routes - ALL working endpoints
  get '/api/devices', to: 'api/devices#index'
  get '/api/devices/:id/health', to: 'api/devices#health'
  get '/api/devices/export.csv', to: 'api/devices#export'
  get '/api/swaps', to: 'api/swaps#index'
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'

  # Pages
  root "dashboard#index"
  get '/tech', to: 'dashboard#tech'
  get '/dashboard', to: 'dashboard#index'
end
