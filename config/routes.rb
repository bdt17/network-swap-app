Rails.application.routes.draw do
  root "home#index"
  get '/health', to: ->(_env) { [200, {'Content-Type' => 'text/plain'}, ['OK']] }
end
