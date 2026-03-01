  GNU nano 7.2                             app/channels/swap_updates_channel.rb                                       
class SwapUpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "swap_updates_#{params[:site_id]}"
  end

  def receive(data)
    ActionCable.server.broadcast(
      "swap_updates_#{data['site_id']}",
      data
    )
  end
end
