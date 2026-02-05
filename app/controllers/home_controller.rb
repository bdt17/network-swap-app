class HomeController < ApplicationController
  def index
    @sites = Site.all
    @swap_tickets = SwapTicket.all
  end
end
