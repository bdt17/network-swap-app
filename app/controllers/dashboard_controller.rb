class DashboardController < ApplicationController
  def index
    @devices = Device.all
    @sites = Site.all
  end

  def inventory
    @devices = Device.where(active: true)
    @sites = Site.all
  end
end
