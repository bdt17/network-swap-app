Rails.application.routes.draw do
  # Devise WITHOUT layout (bypasses crash)
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  resources :devices
  resources :sites
  resources :swaps
  root 'devices#index'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
