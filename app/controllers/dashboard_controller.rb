class DashboardController < ApplicationController
  before_action :require_login, only: :index
  
  def index
    @devices = 247
    @sites = 14
    @swaps = 23
    @drones = 2
    render layout: 'application'
  end
  
  private
  def require_login
    unless session[:user_id]
      redirect_to session_new_path, alert: 'Please log in'
    end
  end
end
