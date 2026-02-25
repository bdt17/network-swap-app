class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def devices
    render json: [
      {id: 1, name: "PHX-SW-01", status: "active", location: "PHX-DC21-Rack08"},
      {id: 2, name: "PHX-SW-02", status: "active", location: "PHX-DC21-Rack09"}
    ]
  end
end
