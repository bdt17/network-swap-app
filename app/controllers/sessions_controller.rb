class SessionsController < ApplicationController
  def new
    render plain: "Thomas IT Login - admin/thomasit", status: :ok
  end
  def create
    render plain: "Logged in as admin@thomasit.com", status: :ok
  end
end
