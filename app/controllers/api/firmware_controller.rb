class Api::FirmwareController < ApplicationController
  def status
    render json: {
      drone: params[:id],
      version: "v1.2.3",
      latest: "v1.3.0",
      update_available: true,
      size: "24.7MB",
      eta: "2m 15s"
    }
  end
end
