Rails.application.routes.draw do
  devise_for :users   # ← THIS WAS MISSING!
  
  root 'dashboard#index'
  get 'tech', to: 'dashboard#index'
end
