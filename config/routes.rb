Rails.application.routes.draw do
  # ----------------------------------------------------
  # Dashboard / Drone UI (your existing routes)
  # ----------------------------------------------------
  root to: "dashboard#index"
  get "/tech", to: "dashboard#tech", as: :tech
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  # ----------------------------------------------------
  # Phase 14 Drone API (NEW - fixes /api/v1/inspections)
  # ----------------------------------------------------
  namespace :api do
    namespace :v1 do
      post "/inspections", to: "inspections#create"
    end
  end

  # ActionCable (uncomment when ready)
  # mount ActionCable.server => "/cable"
end
