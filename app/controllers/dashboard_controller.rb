class DashboardController < ApplicationController
  before_action :require_login, except: :index

  skip_before_action :require_login, only: :index # Public landing
  skip_before_action :require_login, only: :index # Public landing
  before_action :require_login, except: :index

  skip_before_action :require_login, only: :index # Public landing
  before_action :require_login, except: :index

  def index
    if session[:user_id]
      # Logged in: show full DJI dashboard
      @drone_status = {
        id: "DJI-PHX-179", battery: 85, racks_scanned: 8, total_racks: 12, 
        status: "Scanning PHX-DC21"
      }
    else
      # Not logged in: show login teaser
      render 'teaser', layout: 'application' and return
    end
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to session_new_path
    end
  end
end
