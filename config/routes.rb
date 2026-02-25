Rails.application.routes.draw do
  root 'dashboard#index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'session/new', to: 'sessions#new', as: 'session_new'
  post 'session', to: 'sessions#create'
  delete 'session', to: 'sessions#destroy'
  get 'health', to: proc { [200, {}, ['OK']] }
  get 'api/devices', to: 'api#devices'
  get 'api/shipments', to: 'api#shipments'
end
