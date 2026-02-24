class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def new
    render layout: 'dashboard'
  end

  def create
    if params[:username] == 'admin' && params[:password] == 'thomasit'
      session[:user_id] = 1
      session[:username] = 'admin'
      redirect_to root_path, notice: 'Thomas IT Network Ops Center - Access Granted!'
    else
      flash.now[:alert] = 'Invalid credentials. Use: admin / thomasit'
      render :new, layout: 'dashboard'
    end
  end

  def destroy
    session.destroy
    redirect_to session_new_path, notice: 'Logged out successfully'
  end
end
