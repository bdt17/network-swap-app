module Api
  module V1
    class SwapsController < ApplicationController
      skip_before_action :verify_authenticity_token
      def index
        render json: [
          {id: 2001, device: "Cisco Catalyst 9300", site: "PHX-DC21", tech_id: "brett", status: "ready"}
        ]
      end
      def show
        render json: {id: params[:id], status: "claimed", tech_id: "brett"}
      end
      def update
        render json: {id: params[:id], status: "claimed", message: "Smith,J. #2001 assigned"}
      end
    end
  end
end
