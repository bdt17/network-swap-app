class SessionsController < ApplicationController
  def new
    render file: 'public/index.html' # Use your existing perfect login page
  end
  
  def create
    if params[:password] == 'thomasit'
      session[:user_id] = 1
      redirect_to dashboard_path, notice: 'Welcome to Network Ops'
    else
      render file: 'public/index.html', status: :unprocessable_entity
    end
  end
  
  def destroy
    session.clear
    render file: 'public/index.html', status: :see_other
  end
end
