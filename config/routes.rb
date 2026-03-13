Rails.application.routes.draw do
  root to: "home#index"
  
  # Tech Portal + AR (LIVE ✅)
  get 'tech', to: 'home#tech'
  get 'ar', to: 'ar_overlay#index'
  
  namespace :api, defaults: {format: :json} do
    # Phase 6: Devices + CSV
    resources :devices do
      collection do
        get 'export.csv', to: 'devices#csv_export', as: :csv_export
      end
      member do
        get :health
      end
    end
    
    # Phase 8B: SMS (FIXED)
    post 'dispatch_sms', to: 'dispatch#sms'
    
    # Phase 14: DJI Prep
    get 'health', to: 'health#show'
    get 'drones/fleet', to: 'drones#fleet'
  end
end
