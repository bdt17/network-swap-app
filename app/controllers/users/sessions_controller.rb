class Users::SessionsController < Devise::SessionsController
  layout false  # NO LAYOUT = NO current_user crash
  
  def new
    super
  end
end
