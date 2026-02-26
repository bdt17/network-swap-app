class SessionsController < ApplicationController
  def new
    # Render login form HTML (matches your beautiful Tailwind UI)
    render layout: 'application', status: :ok
  end
  
  def create
    if params[:user][:password] == 'thomasit'
      session[:user_id] = 1
      session[:user_email] = 'admin@thomasit.com'
      redirect_to dashboard_path, notice: 'Welcome to Thomas IT Network Ops'
    else
      flash.now[:alert] = 'Invalid credentials'
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    session.clear
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
