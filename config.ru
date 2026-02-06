require 'rack'
class NetworkSwapApp
  def self.call(env)
    case env['PATH_INFO']
    when '/' 
      [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]]
    when '/health'
      [200, {'Content-Type' => 'text/plain'}, ['OK']]
    else
      [404, {'Content-Type' => 'text/plain'}, ['Not Found']]
    end
  end
end

run NetworkSwapApp
