class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Rails 8.1 + Devise fix
  def current_user
    super || nil
  end
  
  # Safe user info helper
  helper_method :current_user_info
  
  def current_user_info
    user_signed_in? ? current_user&.info : nil
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes


end
