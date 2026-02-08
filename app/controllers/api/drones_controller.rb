module Api
  class DronesController < ApplicationController
    def index
      render json: {
        count: 2,
        drones: [
          {id: 1, serial: "DJI001", battery: 85, available: true},
          {id: 2, serial: "DJI002", battery: 92, available: true}
        ]
      }
    end
  end
end
