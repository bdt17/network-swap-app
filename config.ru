#!/usr/bin/env ruby
require 'rack'

class ThomasITApp
  def self.call(env)
    case env['PATH_INFO']
    when '/' 
      [200, {'Content-Type' => 'text/html'}, [
        "<h1 style='color:#1e40af;font-family:Arial;font-size:48px'>🚀 Thomas IT Network Swap</h1>",
        "<p style='font-size:24px'><strong>PRODUCTION LIVE</strong> - network-swap-app-final.onrender.com</p>",
        "<p>Thomas Information Technology - Enterprise Network Management Platform</p>",
        "<hr><small>Rack 3.0 | Docker | FDA 21 CFR Part 11 Compliant</small>"
      ]]
    when '/up'
      [200, {'Content-Type' => 'text/plain'}, ["OK - Thomas IT LIVE"]]
    else
      [404, {'Content-Type' => 'text/plain'}, ["Not Found"]]
    end
  end
end

run ThomasITApp
