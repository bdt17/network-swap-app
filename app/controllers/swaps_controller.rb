class SwapsController < ApplicationController
  def index
    render json: [
      {id: 2001, device_id: 6001, site_id: 1, vendor: "Cisco", 
       claimed: true, tech: "Smith,J.", location: "Phoenix DC21"}
    ]
  end

  def create
    render json: {success: true, id: 6002, message: "Cisco EOL created"}, status: :created
  end

  def claim
    render json: {success: true, swap_id: params[:id], tech: "Smith,J.", status: "CLAIMED"}
  end
end
