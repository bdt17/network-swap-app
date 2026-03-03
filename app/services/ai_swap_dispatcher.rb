class AiSwapDispatcher
  def self.dispatch_eol_device(device)
    tech_phone = "+15551234567" # Tech #1 (Smith,J.)
    message = "🚨 AI SWAP: #{device.name} EOL detected @ Phoenix DC21\nRack: #{device.name.split(' ').last}\nDispatch ASAP?"
    
    # Twilio SMS (add gem 'twilio-ruby' to Gemfile)
    client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_TOKEN'])
    client.messages.create(
      from: ENV['TWILIO_PHONE'],
      to: tech_phone,
      body: message
    )
  end
end
