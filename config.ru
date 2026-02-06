require 'rack'

class NetworkSwapStatic
  def self.call(env)
    path = env['PATH_INFO']
    
    case path
    when '/', '/index.html'
      if File.exist?('public/index.html')
        html = File.read('public/index.html', encoding: 'utf-8')
        [200, {'Content-Type' => 'text/html; charset=utf-8'}, [html]]
      else
        [404, {'Content-Type' => 'text/plain'}, ['No index.html']]
      end
    when '/health'
      [200, {'Content-Type' => 'text/plain'}, ['OK']]
    else
      [404, {'Content-Type' => 'text/plain'}, ['Not Found']]
    end
  end
end

run NetworkSwapStatic
