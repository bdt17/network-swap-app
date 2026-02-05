class DashboardController < ApplicationController
  def index
    @devices = Device.all.limit(50)
    @recent_swaps = SwapTicket.last(10) rescue []
    render layout: false, inline: File.read(Rails.root.join("public/index.html"))
  end
end
