Rails.application.routes.draw do
  # NUCLEAR: Pure Rack response - bypasses ALL Rails/Devise/middleware
  get "/", to: proc { [302, {'Location' => '/users/sign_in'}, []] }
  
  devise_for :users
  resources :devices
  resources :sites  
  resources :swaps
  
  get "up" => "rails/health#show", as: :rails_health_check
end
