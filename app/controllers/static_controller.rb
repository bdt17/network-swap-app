class StaticController < ApplicationController
  def favicon
    expires_in 1.year
    send_file Rails.root.join('public', 'favicon.ico'), type: 'image/x-icon', disposition: 'inline'
  end
end
