class DashboardController < ApplicationController
  def index
    @time = Time.now.strftime("%Y-%m-%d %H:%M MST")
    render layout: false
  end
  
  def tech
    @time = Time.now.strftime("%Y-%m-%d %H:%M MST")
    render layout: false
  end
end
