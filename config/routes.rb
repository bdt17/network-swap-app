Rails.application.routes.draw do
  # API routes - ALL endpoints
  get '/api/devices', to: 'api/devices#index'
  get '/api/devices/:id/health', to: 'api/devices#health'
  get '/api/devices/export.csv', to: 'api/devices#export'
  get '/api/swaps', to: 'api/swaps#index'
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'
  post '/api/dispatch_sms', to: 'api/dispatch#sms'     # ← NEW SMS ROUTE FIXED
  
  # Pages
  root "dashboard#index"
  get '/tech', to: 'dashboard#tech'
  get '/dashboard', to: 'dashboard#index'
  get '/ar', to: 'dashboard#ar'                       # ← NEW AR ROUTE
  
  # Devise (if needed)
  devise_for :users
end
