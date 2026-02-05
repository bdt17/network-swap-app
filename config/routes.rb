Rails.application.routes.draw do
  # MVP Dashboard (Phase 4)
  root "dashboard#index"
  get "/dashboard", to: "dashboard#index"
  
  # Static assets (your Tailwind public/index.html)
  get "/inventory", to: ->(env) { [200, {"Content-Type" => "text/html"}, [File.read(Rails.root.join("public/index.html"))]] }
  
  # API Endpoints (Phase 4-7)
  namespace :api do
    resources :devices, only: [:index, :show] do
      get :ai_recommend, on: :member
    end
    resources :swaps, only: [:index, :create]
    resources :audit_logs, only: [:index]
  end
  
  # Healthcheck
  get "/up", to: ->(w) { [200, {"Content-Type" => "text/plain"}, ["OK"]]}
  get "/health", to: ->(w) { [200, {"Content-Type" => "text/plain"}, ["OK - Thomas IT Network Swap App"]]}
  
  # Phase 6 ActionCable
  mount ActionCable.server => "/cable"
end
