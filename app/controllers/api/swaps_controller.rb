module Api
  class SwapsController < ApplicationController
    def index
      render json: [{id: 2001, status: 'claimed', site: 'Phoenix Tower'}]
    end
    
    def show
      render json: {id: params[:id], status: 'in_progress'}
    end
  end
end
