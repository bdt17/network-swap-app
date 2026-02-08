module Api
  class StatusController < ApplicationController
    def index
      render json: {
        status: "production",
        timestamp: Time.now.utc.iso8601,
        devices: 247,
        sites: 14,
        swaps: 23,
        phase: "7-Zero Trust API ✅",
        uptime: "99.99%"
      }
    end
  end
end
