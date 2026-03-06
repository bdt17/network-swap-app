class DroneChannel < ApplicationCable::Channel
  def subscribed
    stream_from "drone_fleet:phoenix_dc21"
  end

  def receive(data)
    ActionCable.server.broadcast "drone_fleet:phoenix_dc21", {
      drone_id: data['drone_id'] || 'DJI-PHX-179',
      battery: data['battery'] || 87,
      issues: data['issues'] || ['loose RJ45', 'thermal B2'],
      timestamp: Time.now.utc.iso8601
    }
  end
end
