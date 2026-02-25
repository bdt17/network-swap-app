class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def new
    # Use application.html.erb for login (no dashboard layout)
    render 'sessions/new', layout: 'application'
  end

  def create
    if params[:username] == 'admin' && params[:password] == 'thomasit'
      session[:user_id] = 1
      session[:username] = 'admin'
      redirect_to root_path, notice: 'Thomas IT Network Ops Center'
    else
      flash.now[:alert] = 'Invalid: admin/thomasit'
      render 'sessions/new', layout: 'application'
    end
  end

  def destroy
    session.destroy
    redirect_to '/session/new'
  end
end
