class Api::SwapsController < ApplicationController
  def index
    swaps = Swap.all
    render json: swaps.as_json(only: [:id, :device_id, :tech_id, :created_at])
  end
end
