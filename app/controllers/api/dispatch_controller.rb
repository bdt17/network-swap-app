class Api::DispatchController < ApplicationController
  def sms
    device = Device.find(params[:device_id])
    result = Twilio::DispatchService.call(
      device_name: device.name,
      tech_phone: params[:tech_phone],
      issue: params[:issue] || 'urgent_network_swap'
    )
    
    render json: result, status: result[:success] ? :ok : :unprocessable_entity
  end
end
