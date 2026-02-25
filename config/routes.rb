Rails.application.routes.draw do
  get 'health', to: proc { [200, {}, ['OK']] }
  
  # PHASE 14 DRONE - DEAD SIMPLE ROUTE
  get '/drone/inspect/:id', to: 'drone#inspect'
end
