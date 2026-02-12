Rails.application.routes.draw do
  get '/health', to: -> (env) { [200, {'Content-Type' => 'text/plain'}, ['OK']] }
  
  namespace :api do
    resources :swaps do
      member do
        post :claim
      end
    end
  end
  
  # Static pages fallback
  get '*path', to: 'pages#tech'
  
  root to: 'pages#tech'
end
