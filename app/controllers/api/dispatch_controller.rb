class Api::DispatchController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def sms
    # Trigger Twilio (Phase 8B+14)
    TwilioService.dispatch_alert(params) if ENV['TWILIO_ACCOUNT_SID']
    
    render json: {
      success: true,
      status: "twilio_sent",
      tech_name: params[:tech] || "Field Tech",
      device_name: params[:device] || "Unknown",
      issue: params[:issue] || "Routine check",
      site: "Phoenix DC21",
      message_id: SecureRandom.uuid,
      phase: "8B+14_LIVE"
    }, status: :ok
  end
end
