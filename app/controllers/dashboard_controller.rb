class DashboardController < ApplicationController
  def tech
    @devices = Device.includes(:site).order(last_seen_at: :desc).limit(100)
  end
end
