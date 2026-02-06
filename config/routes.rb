Rails.application.routes.draw do
  root to: ->(_env) { [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]] }
  get '/health', to: ->(_env) { [200, {'Content-Type' => 'text/plain'}, ['OK']] }
end
