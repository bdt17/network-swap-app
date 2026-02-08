Rails.application.routes.draw do
  root 'dashboard#index'
  get '/inventory', to: 'dashboard#inventory'
  
  namespace :api, defaults: { format: :json } do
    resources :devices, only: [:index, :show]
  end
end
