class DashboardController < ApplicationController
  def index
    @devices = Device.all
    @drones = Drone.all
  end
  
  def tech
    @devices = Device.all
  end
  
  def ar
    render 'ar_glasses'
  end
end
