class SessionsController < ApplicationController
  def new
    render layout: 'application'
  end
  
  def create
    if params[:password] == 'thomasit'
      session[:user_id] = 'admin_thomasit'
      session[:user_email] = 'admin@thomasit.com'
      redirect_to dashboard_path, notice: 'Logged in successfully'
    else
      flash[:alert] = 'Invalid credentials'
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session.delete(:user_id)
    session.delete(:user_email)
    redirect_to root_path, notice: 'Logged out'
  end
end
