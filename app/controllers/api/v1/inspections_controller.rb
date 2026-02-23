class Api::V1::InspectionsController < ApplicationController
def create
  inspection = InspectionLog.create!(
    site_id: params[:site_id] || 1,
    drone_fleet_id: params[:drone_fleet_id] || 1,
    status: 'drone_scan_initiated'
  )
  render json: { 
    status: 'success', 
    message: 'DJI-PHX-179 dispatched - thermal scan initiated',
    inspection_id: inspection.id 
  }, status: :created
end
end
