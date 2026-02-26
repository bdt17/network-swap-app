class DashboardController < ApplicationController
  before_action :require_login
  
  def index
    @devices = 247
    @drones = 2
    @sites = 14
    render layout: 'application'
  end
  
  private
  
  def require_login
    if session[:user_id].nil?
      flash[:alert] = 'Please log in to access Network Ops'
      redirect_to session_new_path
    end
  end
end
