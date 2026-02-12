class SmsService
  def self.claim_notification(swap_ticket, tech_name)
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )
    
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: ENV['DISPATCH_PHONE'],  # +15551234567
      body: "🚛 #{tech_name} claimed ##{swap_ticket.id} → #{swap_ticket.vendor} → Phoenix DC21"
    )
  end
end
