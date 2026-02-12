class SwapsController < ApplicationController
  def index
    render json: [
      {id: 2001, status: "pending", vendor: "Cisco EOL", location: "Phoenix DC21"},
      {id: 2002, status: "claimed", vendor: "Aruba AP-535", tech: "Smith,J."}
    ]
  end

  def create
    render json: {status: "created", id: 2003}
  end

  def claim
    render json: {status: "claimed", ticket: params[:id], tech: "Smith,J."}
  end
end
