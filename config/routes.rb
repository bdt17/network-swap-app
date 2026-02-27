Rails.application.routes.draw do
  # STATIC PAGES (your perfect TailwindCSS designs)
  get '/', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]] }
  get '/dashboard', to: proc { [200, {'Content-Type' => 'text/html'}, [File.read('public/dashboard.html')]] }
  
  # APIs (already working perfectly)
  get '/health', to: proc { [200, {}, ['OK']] }
  get '/api/devices', to: 'api#devices'
  get '/drone/inspect/:id', to: 'drone#inspect'
  get '/tech', to: proc { [200, {}, ['Thomas IT Tech Dashboard - Field Ops Ready']] }
end
