class Api::HealthController < ApplicationController
  def show
    render json: {
      status: "green",
      timestamp: Time.current.iso8601,
      phase: "14",
      drones: 2,
      sites: ["Phoenix DC21"]
    }
  end
end
