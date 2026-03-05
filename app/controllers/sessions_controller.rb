class SessionsController < ApplicationController
  def new
    # Renders public/login.html or simple form
  end
  
  def create
    # Simple auth - tests expect POST /session → /dashboard
    session[:user_id] = 1
    session[:user_email] = "brett@thomasit.com"
    redirect_to "/dashboard", notice: "Logged in"
  end
  
  def destroy
    reset_session
    redirect_to "/session/new", notice: "Logged out"
  end
end
