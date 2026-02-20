class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @swaps = Swap.all.order(created_at: :desc).limit(10)
    @devices = Device.count
    @sites = Site.count
    render plain: "DJI-PHX-179 LIVE | #{Device.count} devices | #{Site.count} sites | #{Swap.count} swaps", layout: false
  end
end
