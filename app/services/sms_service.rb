class SmsService
  def self.claim_notification(ticket_id, tech_name)
    return unless Rails.env.production? && ENV['TWILIO_ACCOUNT_SID']
    
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'], 
      ENV['TWILIO_AUTH_TOKEN']
    )
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['DISPATCH_PHONE'],
      body: "🔧 #{tech_name} claimed ##{ticket_id} → Phoenix DC21"
    )
  end
end
