module Api
  class SwapsController < Api::ApplicationController
    def index
      render json: SwapTicket.where(status: 'pending').includes(:device, :site)
    end
    
    def create
      @swap = SwapTicket.create!(swap_params)
      SwapAlertJob.perform_later(@swap)
      render json: @swap, status: :created
    end
    
    private
    def swap_params
      params.require(:swap_ticket).permit(:device_id, :site_id, :status, :scheduled_at)
    end
  end
end
