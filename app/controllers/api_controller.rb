class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token  # API endpoints

  def devices
    render json: [
      {id: 1, type: "Cisco Catalyst 9300", site: "Phoenix DC21", status: "EOL"},
      {id: 2, type: "DJI-PHX-179", site: "Phoenix DC21", status: "operational", battery: 87}
    ]
  end

  def swaps
    render json: [
      {id: 2001, device: "C9300-24T", site: "Phoenix DC21 Rack3U", status: "available", tech: nil}
    ]
  end

  def claim_swap
    render json: {
      success: true,
      message: "✅ Swap 2001 CLAIMED - SMITH,J dispatched to C9300 Rack3U",
      swap_id: params[:id],
      tech: "SMITH,J.",
      site: "Phoenix DC21",
      timestamp: Time.now.utc.iso8601
    }, status: :ok
  end

  def analytics
    render json: {dashboard: "Phase 8B LIVE"}
  end
end
