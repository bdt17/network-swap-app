Rails.application.routes.draw do
  devise_for :users
  
  get 'dashboard', to: 'dashboard#index'
  get 'tech', to: 'dashboard#index'
  
  namespace :api do
    resources :devices, only: [:index]
    resources :swaps, only: [:index] do
      collection do
        post :claim
      end
    end
  end
  
  root 'dashboard#index'
end
