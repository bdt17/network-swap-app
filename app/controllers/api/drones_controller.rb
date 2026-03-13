class Api::DronesController < Api::ApplicationController
  def fleet
    render json: [
      { id: 1, name: 'DJI-PHX-179', battery: 87, status: 'scanning' },
      { id: 2, name: 'DJI-PHX-225', battery: 95, status: 'idle' }
    ]
  end

  def inspect
    render json: { id: params[:id], status: 'complete' }
  end

  def diagnostics
    render json: { id: params[:id], battery: 87 }
  end
end
