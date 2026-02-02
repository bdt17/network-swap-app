Rails.application.routes.draw do
  devise_for :users

  # Thomas IT Network Swap App
  resources :devices
  resources :sites
  resources :swaps
  root 'devices#index'  # ← SINGLE root - NOW ACTIVE
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # API (JSON)
  namespace :api, defaults: { format: :json } do
    resources :devices, only: [:index, :show]
  end
end
