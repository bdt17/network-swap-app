class InventoryController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @devices = Device.all
    render plain: "Network Inventory: #{@devices.count} devices online", layout: false
  end
  
  def network
    @swaps = Swap.where(status: 'pending').count
    render plain: "Network Swaps Pending: #{@swaps}", layout: false
  end
end
