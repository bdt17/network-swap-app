class Api::DispatchController < ApplicationController
  def sms
    # Phase 8B: Twilio SMS Dispatch (Pharma Transport)
    tech = params[:tech] || "Field Tech"
    device = params[:device] || "Unknown"
    
    # TODO: Real Twilio integration
    render json: {
      status: "queued",
      tech: tech,
      device: device,
      sid: "SM#{SecureRandom.hex(8).upcase}",
      message: "Dispatch: #{tech} → #{device} (Phoenix DC21)"
    }, status: :accepted
  end
end
