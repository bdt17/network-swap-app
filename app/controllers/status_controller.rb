class StatusController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :dispatch_sms

  def index
    render plain: "🚨 AI SWAP DISPATCH LIVE - Phoenix DC21 | DJI 87%"
  end

  def dispatch_sms
    render json: {
      success: true,
      message: "📱 SMS dispatched to SMITH,J.",
      device: "C9300 Rack3U",
      tech: "SMITH,J.",
      site: "Phoenix DC21",
      timestamp: Time.now.utc.iso8601
    }, status: :ok
  end
end
