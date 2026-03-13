class Api::HealthController < ApplicationController
  def show
    render json: {status: "green", phase: "14", drones: 2, timestamp: Time.current}
  end
end
