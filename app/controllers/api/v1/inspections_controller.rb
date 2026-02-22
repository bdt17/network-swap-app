module Api
  module V1
    class InspectionsController < ApplicationController
      before_action :authenticate_user!, only: [:create]

      def index
        render json: InspectionLog.recent, each_serializer: InspectionLogSerializer
      end

      def create
        inspection = InspectionLog.create!(inspection_params)
        render json: inspection, status: :created
      end

      private

      def inspection_params
        params.require(:inspection).permit(:site_id, :drone_fleet_id)
      end
    end
  end
end
