class DashboardController < ApplicationController
  def inventory
    @devices = Device.all
    render layout: 'application', inline: '<h1>Inventory</h1><%= @devices.count %> devices'
  end
end
