Rails.application.routes.draw do
  # BYPASS DEVISE COMPLETELY
  get "/", to: "devices#index"
  resources :devices, only: :index
  
  get "up" => "rails/health#show", as: :rails_health_check
end
