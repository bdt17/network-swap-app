class ApplicationController < ActionController::Base
  helper_method :current_tech
  
  private
  def current_tech
    session[:tech_id]
  end
end
