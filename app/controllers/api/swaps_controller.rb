class Api::SwapsController < ApplicationController
  def create
    @swap = SwapTicket.new(permitted_params)
    if @swap.save
      render json: { 
        success: true, 
        id: @swap.id,
        status: @swap.status_name  # FIX "unknown"
      }, status: :ok  # Test expects 200
    else
      render json: { errors: @swap.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def claim
    @swap = SwapTicket.find(params[:id])
    @swap.update!(assigned_tech_id: 1, status: 2)
    render json: { success: true, status: @swap.status_name }
  end

  private
  def permitted_params
    params.permit(:device_id, :site_id, :vendor, :status, :notes).to_h
  end
end
