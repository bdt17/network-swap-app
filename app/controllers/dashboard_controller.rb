class DashboardController < ApplicationController
  def index
    render layout: false # Use public/dashboard.html for pro styling
  end
end
