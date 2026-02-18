class SwapsController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard
    @devices = Device.all
    @swaps = SwapTicket.all
  end
end
