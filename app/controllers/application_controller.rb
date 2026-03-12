class ApplicationController < ActionController::Base
  helper_method :logged_in?

  private

  def logged_in?
    session[:user_id].present?
  end
end

  # Skip CSRF for JSON API calls
  skip_before_action :verify_authenticity_token, if: :json_request?

  private

  def json_request?
    request.content_type == 'application/json' || request.format.json?
  end
