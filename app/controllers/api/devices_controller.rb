class Api::DevicesController < ApplicationController
  def index
    render json: [{id: 1, model: "Cisco Catalyst 9300", status: "active"}]
  end
end
