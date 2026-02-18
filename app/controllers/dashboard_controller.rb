class DashboardController < ApplicationController
  include Authentication
  
  before_action :require_authentication
  
  def index
    @devices = Device.all
  end
end
