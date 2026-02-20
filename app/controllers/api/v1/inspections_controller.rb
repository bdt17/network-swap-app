class Api::V1::InspectionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def create
    render json: { status: 'DJI-PHX-179 inspection received', battery: 85 }, status: :ok
  end
end
