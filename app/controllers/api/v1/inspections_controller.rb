class Api::V1::InspectionsController < ApplicationController
  skip_before_action :verify_authenticity_token # Skip CSRF for API
  
  def create
    inspection = InspectionLog.create!(
      site_id: params[:site_id]&.to_i || params[:inspection]&.[](:site_id)&.to_i || 1,
      drone_fleet_id: params[:drone_fleet_id]&.to_i || params[:inspection]&.[](:drone_fleet_id)&.to_i || 1,
      status: 'drone_scan_initiated'
    )
    
    render json: {
      status: 'success',
      message: '🚁 DJI-PHX-179 dispatched - thermal scan initiated',
      inspection_id: inspection.id,
      drone_status: 'scanning_phoenix_dc_racks'
    }, status: :created
  end
end
