class SessionsController < ApplicationController
  def new
    render layout: 'application'
  end
  
  def create
    if params[:password] == 'thomasit'
      render json: { logged_in: true, user: 'admin@thomasit.com' }, status: :ok
    else
      render json: { error: 'Invalid credentials' }, status: 401
    end
  end
end
