Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    get :status, to: "status#index"
    resources :devices do
      collection do
        get :critical
      end
    end
  end
end
    resources :swaps, only: [:index, :create]
