class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new; render plain: "LOGIN OK", status: 200; end
  def create; session[:user_id] = 1; render json: {status: 'ok'}, status: 200; end
  def destroy; session[:user_id] = nil; render json: {status: 'ok'}, status: 200; end
end
