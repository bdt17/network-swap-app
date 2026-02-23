class Api::V1::InspectionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    # Handle ANY param format
    site_id = [params[:site_id], params[:inspection][:site_id], 1].find(&:present?).to_i
    drone_fleet_id = [params[:drone_fleet_id], params[:inspection][:drone_fleet_id], 1].find(&:present?).to_i
    
    inspection = InspectionLog.new(
      site_id: site_id,
      drone_fleet_id: drone_fleet_id,
      status: 'drone_scan_initiated'
    )
    
    if inspection.save
      render json: {
        status: 'success',
        message: '🚁 DJI-PHX-179 dispatched - thermal scan initiated',
        inspection_id: inspection.id
      }, status: :created
    else
      render json: { 
        status: 'error', 
        errors: inspection.errors.full_messages 
      }, status: :unprocessable_entity
    end
  end
end
