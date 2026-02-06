Rails.application.routes.draw do
  root "home#index"
  
  # Health + Static endpoints
  get "health", to: ->(env) { [200, {"Content-Type" => "application/json"}, ["OK"]] }
  get "inventory", to: ->(env) { [200, {"Content-Type" => "application/json"}, ["Inventory API LIVE"]] }
  
  # API routes (FIXED namespace)
  namespace :api do
    resources :devices do
      member do
        get :ai_recommend
      end
    end
    resources :audit_logs, only: [:index]
  end
end
