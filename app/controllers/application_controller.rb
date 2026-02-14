class ApplicationController < ActionController::Base
  def root
    redirect_to '/tech' # Skip login → LIVE dashboard
  end
end
