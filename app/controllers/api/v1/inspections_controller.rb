class Api::V1::InspectionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    render json: {
      status: 'success',
      message: '🚁 DJI-PHX-179 dispatched - thermal scan initiated',
      inspection_id: rand(1000..9999),
      drone_status: 'scanning_phoenix_dc_racks',
      battery: '85%',
      racks_scanned: 3,
      thermal_alerts: 0,
      estimated_completion: Time.now + 5.minutes
    }, status: :created
  end
end
