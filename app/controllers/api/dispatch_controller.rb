class Api::DispatchController < ApplicationController
  def sms
    render json: {
      status: "queued",
      tech: params[:tech] || "Unknown",
      device: params[:device] || "Unknown", 
      sid: "SM#{SecureRandom.hex(4).upcase}",
      message: "Dispatch: Field Tech → Phoenix DC21"
    }, status: :accepted
  end
end
