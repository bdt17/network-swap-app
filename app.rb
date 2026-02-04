#!/usr/bin/env ruby
require 'sinatra/base'

class ThomasIT < Sinatra::Base
  set :bind, '127.0.0.1'
  set :port, ENV['PORT'] || 3000
  set :environment, :development
#  set :environment, :production

  # ✅ CSS ENDPOINT (was missing!)


    File.read('app/views/swap.erb')
  end




