class Api::DispatchController < ApplicationController
  skip_forgery_protection
  
  def sms
    phone = params[:tech_phone]
    message = params[:message] || "Network swap dispatch"
    
    # TODO: Add Twilio integration here
    render json: { 
      status: "SMS dispatched", 
      phone: phone,
      message: message,
      sid: "mock-#{rand(100000)}"
    }, status: :ok
  end
end
