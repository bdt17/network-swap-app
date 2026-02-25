class ApiController < ApplicationController
  def devices
    render json: [
      {id: 1, type: 'Cisco Catalyst 9300', site: 'Phoenix DC21', status: 'EOL'},
      {id: 2, type: 'DJI-PHX-179', site: 'Phoenix DC21', status: 'operational'}
    ]
  end
end
