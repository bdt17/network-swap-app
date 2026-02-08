module Api
  class ApplicationController < ::ApplicationController
    respond_to :json
    skip_before_action :verify_authenticity_token
  end
end
  before_action :require_jwt

  private

  def require_jwt
    render json: {error: 'Unauthorized'}, status: 401 unless current_user
  end
