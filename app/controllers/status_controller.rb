class StatusController < ApplicationController
  def index; end
  
  def dispatch_sms
    eol_device = Device.where(status: 'EOL').first
    tech_phone = '+15551234567'  # Smith,J. Tech #1
    message = "🚨 AI SWAP ALERT\n#{eol_device&.name || 'Critical device'} EOL\nPhoenix DC21 - Rack3U\nDispatch ASAP? Reply YES/NO"
    
    if ENV['TWILIO_SID'].present? && ENV['TWILIO_AUTH_TOKEN'].present? && ENV['TWILIO_PHONE'].present?
      require 'twilio-ruby'
      client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
      sms = client.messages.create(
        from: ENV['TWILIO_PHONE'],
        to: tech_phone,
        body: message
      )
      render json: { 
        success: true,
        message: "✅ REAL SMS SENT! SID: #{sms.sid}",
        device: eol_device&.name,
        phone: tech_phone,
        twilio: true
      }
    else
      render json: { 
        success: true,
        message: "AI dispatched Smith,J. → #{eol_device&.name} (Twilio env vars needed)",
        twilio_ready: false,
        mock_sms: message,
        missing_env: ['TWILIO_SID', 'TWILIO_AUTH_TOKEN', 'TWILIO_PHONE'].select { |k| ENV[k].blank? }
      }
    end
  end
end
