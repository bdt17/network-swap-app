class Api::FirmwareController < ApplicationController
  def status
    render json: {drone: params[:id], version: "v1.2.3", update_available: true}
  end
end
