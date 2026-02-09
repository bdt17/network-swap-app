class Api::SwapsController < ApplicationController
  before_action :set_swap_ticket, only: [:show, :update]

  def index
    render json: SwapTicket.includes(:device, :site).all
  end

  def show
    render json: @swap_ticket
  end

  def create
    @swap_ticket = SwapTicket.new(swap_params)
    if @swap_ticket.save
      render json: @swap_ticket, status: :created
    else
      render json: @swap_ticket.errors, status: :unprocessable_entity
    end
  end

  def bulk_create
    swaps = params[:swaps] || []
    created = []
    
    SwapTicket.transaction do
      swaps.each do |swap_data|
        ticket = SwapTicket.create!(swap_data.merge(
          assigned_tech_id: 1,
          assigned_tech_type: 'Tech'
        ))
        created << ticket
      end
    end
    
    render json: created, status: :created
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def alert_test
    SwapAlertJob.perform_later(1)
    render json: { message: 'Alert job queued' }
  end

  private

  def set_swap_ticket
    @swap_ticket = SwapTicket.find(params[:id])
  end

  def swap_params
    params.require(:swap_ticket).permit(:device_id, :site_id, :status, :scheduled_at, :vendor, :notes, :assigned_tech_id, :assigned_tech_type)
  end
end
