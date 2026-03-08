Rails.application.routes.draw do
  # Custom session routes (matches your tests)
  get '/session/new', to: 'devise/sessions#new'
  post '/session', to: 'devise/sessions#create'
  delete '/session', to: 'devise/sessions#destroy'

  # FIXED: Proper nested API routes
  namespace :api do
    resources :devices do
      collection do
        get :export, defaults: { format: :csv }
      end
      member do
        get :health
      end
    end
    resources :swaps
  end

  # Dashboard root
  root "dashboard#index"
end
