class DashboardController < ApplicationController
  def index
    @devices = Device.limit(10)
    @sites = Site.limit(5)
  end

  def inventory
    @devices = Device.where(active: true)
    @sites = Site.all
  end
end
