module Api
  class DronesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def fleet; render json: [{id: "DJI-PHX-179", battery: 87, status: "scanning Phoenix DC21", app_id: 180694}]; end
    def inspect; render json: {id: params[:id], status: "PASS", firmware: "v01.00.04.00"}; end
    def control; render json: {id: params[:id], status: "executed", stream_url: "rtmp://dji-phx.stream/#{params[:id]}"}; end
  end
end
