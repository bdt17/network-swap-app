Rails.application.routes.draw do
  root 'dashboard#index'                    # FIX ROOT 404
  get 'dashboard', to: 'dashboard#index'
  get 'health', to: proc { [200, {}, ['OK']] }
  get 'tech', to: 'public#tech'
  
  # PHASE 14 DRONE - SIMPLE URL
  get '/drone/inspect/:id', to: 'drone#inspect'
end
