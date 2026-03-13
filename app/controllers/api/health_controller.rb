class Api::HealthController < Api::ApplicationController
  def show
    render json: { status: 'ok' }
  end
end
