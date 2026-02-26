Rails.application.routes.draw do
  get '/', to: proc { [200, {}, [File.read('public/index.html')]] }
  get '/dashboard', to: proc { [200, {}, [File.read('public/dashboard.html')]] }
  get '/health', to: proc { [200, {}, ['OK']] }
  get '/api/devices', to: 'api#devices'
  get '/drone/inspect/:id', to: 'drone#inspect'
  get '/tech', to: proc { [200, {}, ['Thomas IT Tech Dashboard - Field Ops Ready']] }
  
  # SIMPLIFIED SESSION ROUTES (no controller dependency)
  post '/session', to: proc { |env|
    if env['rack.input'].read.include?('thomasit')
      [302, {'Location' => '/dashboard.html'}, []]
    else
      [422, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]]
    end
  }
  delete '/session', to: proc { [303, {'Location' => '/'}, []] }
end
