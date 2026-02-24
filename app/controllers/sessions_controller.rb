class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def new
    render layout: 'dashboard'
  end

  def create
    if params[:username] == 'admin' && params[:password] == 'thomasit'
      session[:user_id] = 1
      session[:username] = 'admin'
      redirect_to root_path, notice: 'Thomas IT Network Ops - Access Granted!'
    else
      flash.now[:alert] = 'Invalid: admin/thomasit'
      render :new, layout: 'dashboard'
    end
  end

  def destroy
    session.destroy
    redirect_to session_new_path
  end
end
