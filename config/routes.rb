Rails.application.routes.draw do
  root 'dashboard#index'
  
  # Dashboard routes
  get '/tech', to: 'dashboard#tech'
  get '/dashboard/tech', to: 'dashboard#tech'
  
  # API routes - NAMESPACED
  namespace :api do
    get '/dispatch_sms', to: 'dispatch#sms'
    
    resources :devices, only: [:index] do
      member do
        get :health
      end
    end
    
    resources :swaps, only: [:index] do
      member do
        post :claim
      end
    end
    
    get '/devices/export.csv', to: 'devices#export'
  end
end
