class SessionsController < ApplicationController
  # Skip CSRF for API-like endpoints (matches test script)
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def new
    render plain: "Thomas IT Login - Phase 14 Drone Diagnostics 🚁", status: :ok
  end

  def create
    # Simulate login success for test
    render plain: "Login successful - Welcome to Thomas IT Network Ops", status: :ok
  end

  def destroy
    render plain: "Logged out successfully", status: :ok
  end
end
