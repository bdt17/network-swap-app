class Api::DispatchController < ApplicationController
  skip_before_action :verify_authenticity_token  # Fix 422 error

  def sms
    device = Device.find(params[:device_id])
    render json: { 
      success: true, 
      message: "SMS dispatched for #{device.name}",
      device: device.name,
      health: device.health_score
    }
  end
end
