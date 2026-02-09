class Api::SwapsController < ApplicationController
  before_action :zero_trust_auth, except: [:alert_test]
  
  def index
    render json: SwapTicket.includes(:device, :site).limit(25)
  end
  
  def bulk_create
    swaps = params[:swaps] || []
    created = []
    
    SwapTicket.transaction do
      swaps.each do |data|
        ticket = SwapTicket.create!(data)
        created << ticket
      end
    end
    
    render json: created, status: :created
  end
  
  def alert_test
    render json: { status: 'alert job queued' }
  end
  
  private
  
  def zero_trust_auth
    # Dev bypass - remove in production
    return if Rails.env.development?
    
    token = request.headers['Authorization']&.gsub('Bearer ', '')
    @current_user = ZeroTrustService.authorize(token, request.method.downcase.to_sym, controller_name)
  rescue => e
    render json: { error: e.message }, status: :unauthorized and return
  end
end
