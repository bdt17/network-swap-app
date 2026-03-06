class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

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
      message: "✅ Swap #{params[:id]} CLAIMED - SMITH,J. → Phoenix DC21",
      swap_id: params[:id],
      tech: "SMITH,J.",
      timestamp: Time.now.utc.iso8601
    }, status: :ok
  end
end
