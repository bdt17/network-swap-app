class StatusController < ApplicationController
  def index; end
  
  def dispatch_sms
    eol_device = Device.where(status: 'EOL').first
    message = "🚨 AI SWAP ALERT\n#{eol_device&.name || 'Critical device'} EOL @ Phoenix DC21\nRack: Rack3U\nDispatch Smith,J. ASAP? Reply YES/NO"
    
    if ENV['TWILIO_SID'].present?
      require 'twilio-ruby'
      client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
      sms = client.messages.create(
        from: ENV['TWILIO_PHONE'],
        to: '+15551234567',  # Tech #1 Smith,J.
        body: message
      )
      render json: { 
        message: "✅ REAL SMS SENT! SID: #{sms.sid}",
        device: eol_device&.name,
        success: true,
        twilio: true
      }
    else
      render json: { 
        message: "AI dispatched Smith,J. (Tech #1) - Twilio setup needed",
        device: eol_device&.name,
        mock_sms: message,
        twilio: false
      }
    end
  end
end
