class Twilio::DispatchService
  def self.call(device_name:, tech_phone:, issue:)
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
    
    message = client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'] || '+1234567890',
      to: tech_phone,
      body: "🚨 NETWORK SWAP ALERT: #{device_name}\nIssue: #{issue}\nTech: Reply CONFIRM/DECLINE\nDispatch: https://network-swap-app.onrender.com/tech"
    )
    
    { success: true, sid: message.sid }
  rescue => e
    { success: false, error: e.message }
  end
end
