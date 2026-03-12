# config/routes.rb

Rails.application.routes.draw do
  root 'dashboard#index'

  get '/tech', to: 'dashboard#tech'

  # SMS dispatch endpoint
  post '/api/dispatch_sms', to: 'api/dispatch#sms'

  # Example: add any other routes below
  # get '/about', to: 'pages#about'
  # resources :users
end
