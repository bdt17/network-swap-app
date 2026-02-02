Rails.application.routes.draw do
  get "home/index"
  # TEMPORARY - Nuclear option
  get "/", to: "home#index"
  
  devise_for :users
  resources :devices
  resources :sites
  resources :swaps
  
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api, defaults: { format: :json } do
    resources :devices, only: [:index, :show]
  end
end
