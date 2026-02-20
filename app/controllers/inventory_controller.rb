class InventoryController < ApplicationController
  def index
    @devices = Device.all
    @sites = Site.all
  end
end
