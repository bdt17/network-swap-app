Rails.application.routes.draw do
  namespace :api do
    get "/status", to: "status#index"
    resources :devices, only: [:index]
  end
end
