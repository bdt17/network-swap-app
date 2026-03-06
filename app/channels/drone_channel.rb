class DroneChannel < ApplicationCable::Channel
  def subscribed
    stream_from "drone_fleet:phoenix_dc21"
  end

  def receive(data)
    ActionCable.server.broadcast "drone_fleet:phoenix_dc21", {
      drone_id: data['drone_id'],
      battery: data['battery'],
      issues: data['issues'],
      timestamp: Time.now.utc.iso8601
    }
  end
end
