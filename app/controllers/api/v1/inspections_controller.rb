class Api::V1::InspectionsController < ApplicationController
  def create
    site_id = params[:site_id] || 1
    drone_id = params[:drone_id] || 1
    
    result = DroneInspector.call(site_id: site_id, drone_id: drone_id)
    render json: result, status: :created
  end
end
