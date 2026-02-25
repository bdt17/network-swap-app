class DashboardController < ApplicationController
  def index
    @devices = 247
    @sites = 14
    @swaps = 23
    render layout: 'application', status: :ok
  end
end
