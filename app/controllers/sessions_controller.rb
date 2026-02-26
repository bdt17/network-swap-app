class SessionsController < ApplicationController
  def create
    if params.dig('user', 'password') == 'thomasit' || params[:password] == 'thomasit'
      session[:user_id] = 1
      session[:user_email] = 'admin@thomasit.com'
      redirect_to '/dashboard.html', notice: 'Welcome to Network Ops'
    else
      render file: 'public/index.html', status: :unprocessable_entity
    end
  end
  
  def destroy
    session.clear
    render file: 'public/index.html', status: :see_other
  end
end
