class Api::DronesController < ApplicationController
  before_action -> { authorize_drone! }
  
  def fleet
    render json: [
      {id: "DJI-PHX-179", battery: 87, status: "scanning Phoenix DC21", app_id: 180694},
      {id: "DJI-PHX-225", battery: 95, status: "idle", app_id: 180694}
    ]
  end
  
  def inspect
    render json: {id: params[:id], status: "inspection complete", app_id: 180694}
  end
  
  def control
    render json: {id: params[:id], command: params[:command], status: "executed", app_id: 180694}
  end
  
  private
  
  def authorize_drone!
    unless current_user&.has_role?('drone_operator') || current_user&.has_role?('noc_admin')
      render json: {error: 'Unauthorized for drone operations'}, status: :forbidden
    end
  end
end
