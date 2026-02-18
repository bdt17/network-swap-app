module Api
  class DevicesController < ApplicationController
    def index
      render json: { devices: Device.limit(10).pluck(:name, :model) }
    end
  end
end
