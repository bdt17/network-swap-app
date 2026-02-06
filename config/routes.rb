Rails.application.routes.draw do
  root "home#index"
  
  # Health + Static
  get "health", to: ->(env) { [200, {"Content-Type" => "application/json"}, ["OK"]] }
  get "inventory", to: ->(env) { [200, {"Content-Type" => "application/json"}, ["Inventory API LIVE"]] }
  
  # API Namespace
  namespace :api do
    resources :devices do
      member do
        get :ai_recommend, to: 'devices/ai_recommend#ai_recommend'
      end
    end
    resources :audit_logs, only: [:index]
  end
end
