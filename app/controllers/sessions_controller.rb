class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
  end

  def create
    if params[:tech_id] == "brett"
      session[:tech_id] = "brett"
      redirect_to tech_path, notice: "Field Tech: Brett Thomas ✓ DJI-PHX-179 Ready"
    else
      flash[:alert] = "Invalid Tech ID"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:tech_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
