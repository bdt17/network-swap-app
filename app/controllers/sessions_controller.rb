class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new; render plain: "LOGIN PAGE", status: 200, layout: false; end
  def create; session[:user_id] = 1; render json: {status: 'logged in'}, status: 200; end
  def destroy; session[:user_id] = nil; render json: {status: 'logged out'}, status: 200; end
end
