class Api::DevicesController < ApplicationController
  def index
    render json: Device.all.as_json
  end
end
