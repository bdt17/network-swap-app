class DevicesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @devices = Device.includes(:site).order(warranty_expires: :asc, created_at: :desc)
  end
end
