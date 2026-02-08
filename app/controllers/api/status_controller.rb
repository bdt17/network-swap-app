module Api
  class StatusController < ApplicationController
    def index
      render json: { status: "ok", devices: 247, sites: 14, swaps: 23 }
    end
  end
end
