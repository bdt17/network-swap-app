module Api
  class DevicesController < ApplicationController
    def index
      render json: { devices: [], message: "Phase 4 inventory ready" }
    end
  end
end
