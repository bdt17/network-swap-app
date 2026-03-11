class TwilioService
  def self.dispatch_alert(params)
    require 'twilio-ruby'
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
    
    client.messages.create(
      from: ENV['TWILIO_PHONE'],
      to: "+16025550123", # Brett Thomas field tech
      body: "🚨 PHX DC21: #{params[:device]} #{params[:issue]}\n🔥 Rack 3U: #{params[:temp]}°C\nDJI-PHX-179: #{params[:battery]}%"
    )
  end
end
