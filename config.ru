require './start.rb'
run Rack::Builder.new do
  use Rack::Static, root: 'public', urls: ['/js', '/css', '/swap']
  run lambda { |env| [200, {'Content-Type' => 'text/html'}, [File.read('public/index.html')]] }
end
