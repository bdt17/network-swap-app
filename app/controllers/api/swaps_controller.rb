class Api::SwapsController < ApplicationController
  def index
    swaps = 5.times.map { |i| { id: 2000+i, status: "pending", vendor: "Cisco EOL" } }
    render json: swaps
  end

  def create
    render json: { success: true, id: 2001 }, status: :created
  end

  def claim
    SmsService.claim_notification(params[:id], "Smith,J.") if Rails.env.production?
    render json: { success: true, message: "Swap ##{params[:id]} claimed by Smith,J." }
  end
end
