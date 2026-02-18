module Authentication
  extend ActiveSupport::Concern
  
  included do
    before_action :require_authentication, if: :require_authentication?
  end
  
  def require_authentication
    unless Current.user
      redirect_to new_session_path, alert: "Please sign in."
      return
    end
  end
  
  def require_authentication?
    request.get? && controller_name != "sessions" && controller_name != "passwords"
  end
end
