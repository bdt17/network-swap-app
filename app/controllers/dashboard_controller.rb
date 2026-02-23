class DashboardController < ApplicationController
  def index
    render plain: "Thomas IT Network Swap - DJI-PHX-179 OPERATIONAL 🚁 Login: /login"
  end

  def tech
    @dji_status = { battery: '85%', racks: '3/8', thermal_alerts: 0 }
  end
end
