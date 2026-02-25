class ApiController < ApplicationController
  def devices
    render json: [{id: 1, type: 'Cisco Switch', site: 'Phoenix DC21', status: 'EOL'}]
  end
  def shipments
    render json: [{id: 1, vendor: 'CDW', devices: 25, eta: '2026-03-01'}]
  end
end
