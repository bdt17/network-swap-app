class Api::AnalyticsController < ApplicationController
  def dashboard
    render json: {
      swap_velocity: AnalyticsService.swap_velocity,
      drone_success: AnalyticsService.drone_success_rate, 
      tech_leaderboard: AnalyticsService.tech_leaderboard,
      clearance_times: AnalyticsService.site_clearance_times
    }
  end
end
