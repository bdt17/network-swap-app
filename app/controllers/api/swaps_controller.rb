class Api::SwapsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    swaps = SwapTicket.all.order(created_at: :desc).limit(50)
    render json: swaps.map { |s| 
      { id: s.id, device_id: s.device_id, vendor: s.vendor, status: s.status,
        assigned_tech_id: s.assigned_tech_id, site_id: s.site_id }
    }
  end
  
  def create
    device = Device.find_or_create_by!(device_id: params[:device_id], vendor: params[:vendor])
    site = Site.find_or_create_by!(name: 'Phoenix DC21', code: 'PHX21')
    
    swap = SwapTicket.create!(
      device: device, site: site, vendor: params[:vendor] || 'Cisco',
      status: 'scheduled', assigned_tech_id: 1, scheduled_at: 1.hour.from_now
    )
    
    ActionCable.server.broadcast "device_status_#{swap.device_id}", swap.as_json
    render json: { success: true, swap: swap }, status: 201
  end
  
  def claim
    swap = SwapTicket.find(params[:id])
    old_status = swap.status
    swap.update!(assigned_tech_id: 1, status: 'claimed')  # Smith,J. ID=1
    
    # Broadcast to ALL techs + dispatch
    ActionCable.server.broadcast "device_status_#{swap.device_id}", swap.as_json
    ActionCable.server.broadcast "dispatch_tower", {
      swap_id: swap.id, tech: 'Smith,J.', from: old_status, to: 'CLAIMED 🚀'
    }
    
    render json: { success: true, message: "🎉 Smith,J. claimed Swap ##{swap.id}" }
  end
end
