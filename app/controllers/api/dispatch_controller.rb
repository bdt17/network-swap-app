class Api::DispatchController < ApplicationController
  def sms
    render json: {
      status: "queued",
      tech: params[:tech] || "Field Tech",
      device: params[:device] || "Unknown",
      sid: "SM#{rand(10**16).to_s(36).upcase}",
      message: "Dispatch: #{params[:tech]} → #{params[:device]} (Phoenix DC21)"
    }, status: :accepted
  end
end
