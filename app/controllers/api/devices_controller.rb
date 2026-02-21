module Api
  class DevicesController < ApplicationController
    def index
      render json: [
        { id: 1, name: 'Test Device 1' },
        { id: 2, name: 'Test Device 2' }
      ]
    end
  end
end
