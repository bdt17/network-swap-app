class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def new
    render layout: 'application'
  end

  def create
    if params[:username] == 'admin' && params[:password] == 'thomasit'
      session[:user_id] = 1
      session[:username] = 'admin'
      redirect_to dashboard_path, notice: 'Login successful'
      return
    else
      flash.now[:alert] = 'Invalid credentials'
      render :new, layout: 'application'
    end
  end

  def destroy
    session.destroy
    redirect_to session_new_path
  end
end
