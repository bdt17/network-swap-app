class Api::DispatchController < Api::ApplicationController
  def sms
    render json: { success: true, tech: params[:tech] }
  end
end
