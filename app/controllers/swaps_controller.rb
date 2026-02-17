class SwapsController < ApplicationController
  before_action :authenticate_user!, only: [:claim, :create]  # Devise requirement
  
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid,  with: :record_invalid

  def index
    @swaps = Swap.includes(:tech, :site, :device).page(params[:page])
    render json: @swaps
  end

  def show  # For claim #2001 - assumes /swaps/:id
    @swap = Swap.includes(:tech, :site, :device).find(params[:id])
    render json: {
      id: @swap.id,
      device_id: @swap.device_id,
      site_id: @swap.site_id,
      vendor: @swap.device&.vendor || "Cisco",
      claimed: @swap.claimed?,
      tech: @swap.tech&.name,
      location: @swap.site&.name || "Phoenix DC21"
    }
  end

  def claim
    @swap = Swap.find(params[:id])
    @swap.update!(tech: current_user, claimed_at: Time.current)
    render json: {
      success: true,
      swap_id: @swap.id,
      tech: current_user.name,
      status: "CLAIMED"
    }
  end

  def create
    @swap = Swap.new(swap_params)
    @swap.save!
    render json: { success: true, id: @swap.id, message: "Cisco EOL created" }, status: :created
  end

  private

  def swap_params
    params.require(:swap).permit(:device_id, :site_id, :vendor)
  end

  def record_not_found
    render json: { error: "Swap not found" }, status: 404
  end

  def record_invalid
    render json: { error: @swap.errors.full_messages }, status: 422
  end
end
