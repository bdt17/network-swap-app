class SwapsController < ApplicationController
  def index
    render json: { count: 23, status: "pending" }
  end
  
  def claim
    render json: { 
      swap_id: params[:id], 
      claimed_by: params[:user] || "Brett Thomas", 
      status: "claimed" 
    }
  end
end
