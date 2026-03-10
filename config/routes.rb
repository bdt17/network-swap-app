Rails.application.routes.draw do
  resources :dashboard, only: [:index] do
    get :tech, on: :collection
    get :ar, on: :collection
  end
  
  namespace :api do
    resources :devices do
      get :health, on: :member
      get :export, on: :collection, defaults: {format: 'csv'}
    end
    resources :swaps, only: [:index]
  end
end

  post '/api/dispatch_sms', to: 'api/dispatch#sms'
