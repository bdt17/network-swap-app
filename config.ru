require 'rack'

class StaticApp
  def self.call(env)
    path = env['PATH_INFO']
    
    if path == '/' or path == '/index.html'
      html = File.read('public/index.html', encoding: 'utf-8')
      [200, {'Content-Type' => 'text/html; charset=utf-8'}, [html]]
    elsif path == '/health'
      [200, {'Content-Type' => 'text/plain'}, ['OK']]
    else
      [404, {'Content-Type' => 'text/plain'}, ['Not Found']]
    end
  end
end

run StaticApp
