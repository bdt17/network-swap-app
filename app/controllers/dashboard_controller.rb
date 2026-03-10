class DashboardController < ApplicationController
  def index
    @devices = Device.all
    @drones = Drone.all
  end
  
  def tech
    @devices = Device.where(status: %w[operational needs_firmware])
    @drones = Drone.all  # ← FIX: Always set @drones
    render :index
  end
  
  def ar
    @devices = Device.all
    render :ar
  end
end
