class DeviceStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "device_status_site_21"
    puts "🎉 Tech connected to Site 21 LIVE updates"
  end

  def unsubscribed
    puts "👋 Tech disconnected"
  end
end
