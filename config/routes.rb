Rails.application.routes.draw do
  namespace :api do
    get "/status", to: "status#index"
  end
end

  resources :devices, only: [:index], controller: 'api/devices'
