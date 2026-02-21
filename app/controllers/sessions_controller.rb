class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def new
  end

  def create
    flash[:notice] = 'Logged in successfully! Welcome to Phase 13.'
    redirect_to dashboard_path
  end

  def destroy
    flash[:notice] = 'Logged out successfully.'
    redirect_to login_path
  end
end
