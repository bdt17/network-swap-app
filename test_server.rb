require 'sinatra/base'
class TestApp < Sinatra::Base
  get '/' do
    "Server works!"
  end
  run! if app_file == $0
end
