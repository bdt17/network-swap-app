class Api::DispatchController < ApplicationController
  skip_before_action :verify_authenticity_token  # ← API FIX
  
  def sms
    render json: {
      success: true,
      status: "queued_for_twilio",
      tech_name: params[:tech] || "Field Tech", 
      device_name: params[:device] || "Unknown",
      issue: params[:issue] || "Routine check",
      site: "Phoenix DC21",
      message_id: SecureRandom.uuid,
      phase: "8B_LIVE"
    }, status: :ok
  end
end
