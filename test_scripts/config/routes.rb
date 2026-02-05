Rails.application.routes.draw do
  namespace :api do
    resources :swaps
    resources :devices
  end
end
