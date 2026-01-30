class SwapsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @swap_tickets = SwapTicket.includes(:device).includes(device: :site).all
  end
  
  def new
    @swap_ticket = SwapTicket.new
    @devices = Device.eol # Only EOL devices for swaps
  end
  
  def create
    @swap_ticket = SwapTicket.new(swap_ticket_params)
    if @swap_ticket.save
      redirect_to swaps_path, notice: "Swap ticket created successfully!"
    else
      render :new
    end
  end
  
  def show
    @swap_ticket = SwapTicket.find(params[:id])
  end
  
  private
  
  def swap_ticket_params
    params.require(:swap_ticket).permit(:device_id, :status, :notes)
  end
end
