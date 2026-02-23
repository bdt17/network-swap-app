class SessionsController < ApplicationController
  def new
    render layout: 'application'
  end
  
  def create
    if params[:tech_id] == "brett"
      session[:tech_id] = "brett"
      redirect_to "/tech", notice: "Field Tech: Brett Thomas ✓ DJI-PHX-179 Ready"
    else
      flash[:alert] = "Invalid Tech ID"
      render :new
    end
  end
  
  def destroy
    session[:tech_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end
