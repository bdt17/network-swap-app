class SessionsController < ApplicationController
  def create
    user_params = params[:user] || params
    user = User.find_by(email: user_params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
