class Api::V1::DroneController < ApplicationController
  def inspect
    render json: {
      status: 'operational',
      drone_id: 'DJI-PHX-179',
      site: 'Phoenix DC21 Rack 3U',
      issues: ['loose RJ45 rack 3U', 'thermal alert switch B2', 'dust filter clogged'],
      video_stream: 'ws://network-swap-app.onrender.com/cable/drone_feed',
      timestamp: Time.now.utc.iso8601,
      swarm_ready: true
    }, status: :ok
  end
end
