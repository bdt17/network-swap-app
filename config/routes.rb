Rails.application.routes.draw do
  namespace :api do
    resources :swaps, only: [:index, :show, :create] do
      collection do
        post :bulk_create
        post :alert_test
      end
    end
    resources :sites, only: [:index] do
      collection do
        get :count
      end
    end
    resources :devices, only: [:index] do
      collection do
        get :count
      end
    end
  end
  
  root to: -> { [200, {}, ['See /api/swaps for Phase 5-6'] ] }
end
