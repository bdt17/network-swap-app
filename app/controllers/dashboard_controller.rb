class DashboardController < ApplicationController
  def index
    if session[:user_id].blank?
      redirect_to '/session/new'
    else
      @drone_status = {
        id: "DJI-PHX-179",
        battery: 85,
        racks_scanned: 8,
        total_racks: 12,
        status: "Scanning PHX-DC21"
      }
      render layout: 'dashboard'
    end
  end
end
