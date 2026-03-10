Rails.application.routes.draw do
  get '/api/devices', to: 'api/devices#index'
  get '/api/devices/:id/health', to: 'api/devices#health'
  get '/api/devices/export.csv', to: 'api/devices#export'
  get '/api/swaps', to: 'api/swaps#index'
  root "dashboard#index"
  get '/tech', to: 'dashboard#tech'
  get '/dashboard', to: 'dashboard#index'
end
