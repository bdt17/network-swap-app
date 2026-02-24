class DroneVideoStreamChannel < ApplicationCable::Channel
  def subscribed
    stream_for Site.find(params[:site_id])
  end

  def receive(data)
    ActionCable.server.broadcast("drone_video_stream_#{params[:site_id]}", data)
  end
end
