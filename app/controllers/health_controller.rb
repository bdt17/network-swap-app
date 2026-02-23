class HealthController < ApplicationController
  def show
    render json: { 
      status: 'operational', 
      timestamp: Time.now,
      dji_phx_179: 'live_scanning'
    }
  end
end
