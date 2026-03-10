Rails.application.routes.draw do
  # API - ALL working endpoints
  get '/api/devices', to: 'api/devices#index'
  get '/api/devices/:id/health', to: 'api/devices#health'
  get '/api/devices/export.csv', to: 'api/devices#export'
  get '/api/swaps', to: 'api/swaps#index'
  post '/api/swaps/:id/claim', to: 'api/swaps#claim'
  post '/api/dispatch_sms', to: 'api/dispatch#sms'  # Phase 8B SMS
  
  # Pages - Field tech operational
  root "dashboard#index"
  get '/tech', to: 'dashboard#tech'
  get '/dashboard', to: 'dashboard#index'
  get '/ar', to: 'dashboard#ar'                    # Phase 10 AR
end

  post '/api/dispatch_sms', to: 'api/dispatch#sms'
