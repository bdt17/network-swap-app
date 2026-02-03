require './app.rb'

run Rack::Builder.new do
  use Rack::ShowExceptions
  run ThomasIT
end
