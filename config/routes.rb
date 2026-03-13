Rails.application.routes.draw do
  root to: "home#index"

  # Phase 8A/10: Tech Portal + AR Glasses (LIVE ✅)
  get 'tech', to: 'home#tech'
  get 'ar', to: 'ar_overlay#index'

  namespace :api, defaults: {format: :json} do
    # Phase 6: Devices + CSV Export + Health
    resources :devices, only: [:index, :show] do
      member do
        get :health
      end
      collection do
        get :export, defaults: {format: 'csv'}
      end
    end

    # Phase 8B: Twilio SMS Dispatch (FIXED)
    post 'dispatch_sms', to: 'dispatch#sms'

    # Phase 14: DJI Drone Prep (Tomorrow)
    get 'health', to: 'health#show'
    get 'drones/fleet', to: 'drones#fleet'
    get 'drones/:id/inspect', to: 'drones#inspect'
    get 'drones/:id/diagnostics', to: 'drones#diagnostics'
    
    # Phase 13: Firmware
    get 'firmware/:id/status', to: 'firmware#status'
  end
end
