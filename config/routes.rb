Rails.application.routes.draw do
  get '/health', to: -> (env) { [200, {'Content-Type' => 'text/plain'}, ['OK']] }
  
  # EXACT test script URLs
  resources :swaps, path: 'api/swaps' do
    member do
      post :claim
    end
  end
  
  root to: proc { [200, {}, ['Thomas IT Network Swap API']] }
end
