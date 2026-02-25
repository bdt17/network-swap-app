class DashboardController < ApplicationController
  before_action :require_login

  def index
    @drone_status = {
      id: "DJI-PHX-179",
      battery: 85,
      racks_scanned: 8,
      total_racks: 12,
      status: "Scanning PHX-DC21"
    }
    render layout: 'application'
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to '/session/new', alert: 'Thomas IT Network Ops requires login'
    end
  end
end
