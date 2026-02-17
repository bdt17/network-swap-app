module Api
  class SwapsController < ApplicationController
    def index
      render json: SwapTicket.all.as_json(include: [:device, :site])
    end

    def show
      swap = SwapTicket.find(params[:id])
      render json: swap.as_json(include: [:device, :site])
    end
  end
end
