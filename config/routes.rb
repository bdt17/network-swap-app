Rails.application.routes.draw do
  get '/session/new', to: 'devise/sessions#new'
  post '/session', to: 'devise/sessions#create'  
  delete '/session', to: 'devise/sessions#destroy'

  # Match your existing controllers in app/controllers/api/
  get '/api/devices', to: 'api/devices#index'
  get '/api/devices/:id/health', to: 'api/devices#health'
  get '/api/devices/export.csv', to: 'api/devices#export'
  get '/api/swaps', to: 'api/swaps#index'

  root "dashboard#index"
  get '/tech', to: 'dashboard#tech'
  get '/dashboard', to: 'dashboard#index'
end
  get '/api/devices/:id/health', to: 'api/devices#health'
  get '/api/devices/export.csv', to: 'api/devices#export'
  post '/session', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'
