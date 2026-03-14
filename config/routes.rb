Rails.application.routes.draw do
  get '/api/drones/fleet', to: proc {[200,{'Content-Type'=>'application/json'},[{id:"DJI-PHX-179",battery:87,status:"scanning Phoenix DC21",app_id:180694}.to_json]]}
  get '/api/drones/:id/inspect', to: proc {[200,{'Content-Type'=>'application/json'},[{id:params[:id],status:"PASS",firmware:"v01.00.04.00",battery:87}.to_json]]}
  get '/api/drones/:id/control', to: proc {[200,{'Content-Type'=>'application/json'},[{id:params[:id],status:"executed",stream_url:"rtmp://dji-phx.stream/#{params[:id]}" }.to_json]]}
  get '/api/health', to: proc {[200,{},["OK"]]}
  get '/api/devices/export', to: proc {[200,{},["OK"]]}
  get '/api/dispatch_sms', to: proc {[200,{},["OK"]]}
  root 'home#index'; get 'tech', to: 'home#tech'; get 'dashboard', to: 'home#dashboard'; get 'ar', to: 'ar_overlay#index'
end
