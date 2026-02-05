class ApplicationController < ActionController::API
  # Zero Trust middleware
  before_action :authorize_request
  
  def authorize_request
    # Phase 7: Zero Trust check
    return true if ZeroTrustService.authorize(request.method.downcase.to_sym, params[:controller], current_user)
    
    head :unauthorized unless current_user
  end
  
  private
  
  def current_user
    # Stub for auth - replace with JWT/Devise
    OpenStruct.new(role: 'admin', mfa_verified: true)
  end
end
