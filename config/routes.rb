Rails.application.routes.draw do
  # 100% CRASH-PROOF ROOT
  get "/", to: proc { [302, {'Location' => '/users/sign_in'}, []] }
  
  devise_for :users
  resources :devices
  resources :sites
  resources :swaps
  
  get "up" => "rails/health#show", as: :rails_health_check
  
  namespace :api, defaults: { format: :json } do
    resources :devices, only: [:index, :show]
  end
end
