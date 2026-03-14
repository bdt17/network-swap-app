Rails.application.routes.draw do
  namespace :api, path: "/api" do
    get 'health', to: proc {[200,{},["OK"]]}
    namespace :drones do
      get 'fleet', to: 'drones#fleet'
      get ':id/inspect', to: 'drones#inspect'  
      get ':id/control', to: 'drones#control'
    end
    get 'devices/export', to: proc {[200,{},["OK"]]}
    get 'dispatch_sms', to: proc {[200,{},["OK"]]}
  end
  root 'home#index'; get 'tech', to: 'home#tech'; get 'dashboard', to: 'home#dashboard'; get 'ar', to: 'ar_overlay#index'
end
