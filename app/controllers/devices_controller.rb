class DevicesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @devices = Device.all
  end
end





#class DevicesController < ApplicationController
 # def index
  #  if user_signed_in?
   #   @devices = Device.all
    #else
     # redirect_to new_user_session_path
   # end
  #end
#end


#class DevicesController < ApplicationController
 # before_action :authenticate_user!
  
 # def index
#    @devices = Device.includes(:site).order(warranty_expires: :asc, created_at: :desc)
  # @devices = Device.all  # Simple query 
 #end
#end
