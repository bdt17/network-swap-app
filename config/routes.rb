Rails.application.routes.draw do
  # Auth routes
  get '/session/new', to: 'sessions#new'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'

  # API routes - EXPLICIT mappings to match your controllers
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
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'

  post '/api/dispatch_sms', to: 'api/dispatch#sms'

  post '/api/dispatch_sms', to: 'api/dispatch#sms'
