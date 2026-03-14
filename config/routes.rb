Rails.application.routes.draw do
  get '/api/health', to: proc {[200,{},["OK"]]}
  get '/api/drones/fleet', to: proc {[200,{},["OK"]]}
  get '/api/drones/:id/inspect', to: proc {[200,{},["OK"]]}
  get '/api/drones/:id/control', to: proc {[200,{},["OK"]]}
  get '/api/devices/export', to: proc {[200,{},["OK"]]}
  get '/api/dispatch_sms', to: proc {[200,{},["OK"]]}
  get '/session/new', to: proc {[200,{},["OK"]]}
  match '/session', to: proc {[200,{},["OK"]]}, via: [:post, :delete]
  root 'home#index'; get 'tech', to: 'home#tech'; get 'dashboard', to: 'home#dashboard'; get 'ar', to: 'ar_overlay#index'
end
