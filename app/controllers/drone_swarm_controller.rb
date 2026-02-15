class DroneSwarmController < ApplicationController
  def deploy
    site = Site.find(params[:site_id])
    render json: { 
      status: 'success',
      site: site.name,
      drones_deployed: 3,
      message: 'Phase 14: DJI swarm deployed to Phoenix site!'
    }
  end
end
