class ApplicationController < ActionController::Base
  helper_method :logged_in?

  private

  def logged_in?
    session[:user_id].present?
  end

  def require_login!
    unless logged_in?
      flash[:alert] = 'Network Ops requires login'
      redirect_to '/session/new'
      return
    end
  end
end
