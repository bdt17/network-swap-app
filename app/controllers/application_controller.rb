class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout false  # ← PRO: NO LAYOUTS
end
