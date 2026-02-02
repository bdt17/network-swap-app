#!/usr/bin/env ruby
require 'sinatra/base'
require 'sinatra/contrib/all'

class ThomasIT < Sinatra::Base
  set :bind, '0.0.0.0'
  
  get '/' do
    erb :landing
  end
  
  get '/dashboard' do
    erb :dashboard
  end
  
  get '/up' do
    'OK - Thomas IT LIVE'
  end
end
