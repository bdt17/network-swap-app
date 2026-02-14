module Api
  class SwapsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
      render json: [
        {id: 2001, device: 'Cisco-2960-24TT', site: 'PHX-DC1', status: 'open'}
      ]
    end
    
    def claim
      render json: {success: true, swap_id: params[:id], message: 'Claimed by #2001'}
    end
  end
end
