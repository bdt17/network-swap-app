class ApplicationController < ActionController::Base
  helper_method :current_tech
  
  private
  def current_tech
    session[:tech_id]
  end
end

  helper_method :logged_in?

  private

  def logged_in?
    session[:user_id].present?
  end

  def require_login!
    unless logged_in?
      flash[:alert] = 'Access to Network Ops requires authentication'
      redirect_to session_new_path
    end
  end
