Rails.application.routes.draw do
  root 'dashboard#index'

  get '/tech', to: 'dashboard#tech'

  # Example: add any other routes you need below
  # get '/about', to: 'pages#about'
  # resources :users
end

  post '/api/dispatch_sms', to: 'api/dispatch#sms'
