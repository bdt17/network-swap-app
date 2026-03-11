class DashboardController < ApplicationController
  def index
    @devices_count = Device.count
    @drones_count = 2  # DJI-PHX-179 + backup
    @sites_count = Site.count 
    @swaps_count = 23
    @current_time = Time.now
  end
  
  def tech
    @devices = Device.all
  end
end
