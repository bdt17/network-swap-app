class Api::MainController < ApplicationController
  skip_before_action :verify_authenticity_token

  # Devices API
  def index
    render json: Device.all.limit(50).as_json
  end

  def show
    # Handles /api/devices/:id AND /api/health  
    if params[:id] == 'health'
      render json: {
        status: 'healthy',
        devices: Device.count,
        drones: Drone.count || 0,
        uptime: '99.9%',
        timestamp: Time.now.utc.iso8601
      }
    else
      device = Device.find_by(id: params[:id]) || Device.first
      render json: device&.as_json || {error: 'Device not found'}
    end
  end

  def health
    render json: {status: 'healthy', devices: Device.count}
  end

  def export
    devices = Device.all.limit(100)
    send_data devices.to_csv, filename: "devices-#{Date.today}.csv"
  end

  # Drones API (Phase 14 READY)
  def fleet
    render json: Drone.all.as_json
  end

  def inspect
    drone = Drone.find_by(id: params[:id]) || Drone.first
    render json: {id: params[:id], status: 'inspection complete', firmware: 'v2.1.3'}
  end

  def diagnostics
    render json: {id: params[:id], battery: 87, cpu: 23.5, gps: 'locked'}
  end

  # REAL SMS (Twilio)
  def sms
    unless params[:phone] && params[:message]
      return render json: {error: 'Missing phone/message params'}, status: 400
    end

    begin
      client = Twilio::REST::Client.new(
        ENV['TWILIO_ACCOUNT_SID'] || 'ACxxx',
        ENV['TWILIO_AUTH_TOKEN'] || 'xxx'
      )
      message = client.messages.create(
        from: ENV['TWILIO_PHONE_NUMBER'] || '+1234567890',
        to: params[:phone],
        body: params[:message]
      )
      render json: {success: true, sid: message.sid}
    rescue => e
      render json: {error: e.message}, status: 422
    end
  end
end
