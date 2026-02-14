module Api
  class SwapsController < ApplicationController
    def index
      render json: [
        {id: 2001, device: 'Cisco-2960-48TT', site: 'PHX-DC1', status: 'available', tech: nil},
        {id: 2002, device: 'Aruba-AP-515', site: 'DEN-DC1', status: 'claimed', tech: 'Smith,J. #2001'}
      ]
    end

    def create
      render json: {id: 2003, status: 'created'}, status: :created
    end

    def show
      render json: {id: params[:id], status: 'found'}
    end

    def claim
      render json: {id: params[:id], tech: 'Smith,J. #2001', status: 'claimed'}
    end
  end
end
