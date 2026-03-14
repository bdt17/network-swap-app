Rails.application.routes.draw do
  get '/api/drones/fleet', to: 'drones#fleet'
  get '/api/drones/:id/inspect', to: 'drones#inspect'
  get '/api/drones/:id/control', to: 'drones#control'
  get '/api/health', to: proc {[200,{},["OK"]]}
  get '/api/devices/export', to: proc {[200,{},["OK"]]}
  get '/api/dispatch_sms', to: proc {[200,{},["OK"]]}
  root 'home#index'; get 'tech', to: 'home#tech'; get 'dashboard', to: 'home#dashboard'; get 'ar', to: 'ar_overlay#index'
end
