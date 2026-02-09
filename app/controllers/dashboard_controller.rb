class DashboardController < ApplicationController
  def index
    @device_count = Device.count rescue 0
    @site_count = Site.count rescue 0
    @swap_count = 0
    @swap_count = SwapTicket.count if defined?(SwapTicket) && SwapTicket.table_exists?
  end
end
