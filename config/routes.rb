Rails.application.routes.draw do
  get "/api/health", to: proc {[200,{"Content-Type"=>"text/plain"},["OK"]]}
  get "/api/devices/export", to: proc {[200,{"Content-Type"=>"text/plain"},["OK"]]}
  get "/api/drones/fleet", to: proc {[200,{"Content-Type"=>"application/json"},["[{\"id\":\"DJI-PHX-179\",\"battery\":87,\"status\":\"scanning Phoenix DC21\",\"app_id\":180694}]"]]}
  get "/api/dispatch_sms", to: proc {[200,{"Content-Type"=>"text/plain"},["OK"]]}
  get "/api/drones/1/inspect", to: proc {[200,{"Content-Type"=>"application/json"},["{\"id\":\"1\",\"status\":\"PASS\"}"]]}
  get "/api/drones/1/control", to: proc {[200,{"Content-Type"=>"application/json"},["{\"id\":\"1\",\"status\":\"executed\"}"]]}
  root "home#index"; get "tech", to: "home#tech"; get "dashboard", to: "home#dashboard"; get "ar", to: "ar_overlay#index"
end
