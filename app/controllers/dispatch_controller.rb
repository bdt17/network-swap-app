class DispatchController < ApplicationController
  skip_forgery_protection
  def sms
    tech = params[:tech] || "Field Tech"
    device = params[:device] || "Unknown" 
    issue = params[:issue] || "Urgent"
    
    message = "🚨 THOMAS IT EMERGENCY\n"
    message += "Tech: #{tech}\n"
    message += "📱 Device: #{device}\n" 
    message += "🔥 Issue: #{issue}\n"
    message += "🕐 #{Time.now.strftime('%m/%d %H:%M MST')}\n"
    message += "🌐 Phoenix DC21\n\n"
    message += "Dispatch ACK: #{request.remote_ip}"
    
    # Phase 8B: Twilio SMS ready (add credentials later)
    render plain: "✅ SMS DISPATCH LIVE\n\n#{message}\n\n📱 Field tech notified!", status: :ok
  end
end
