module Api
  module V1
    class InspectionsController < ApplicationController
      skip_before_action :verify_authenticity_token # API endpoint

      def create
        # Simulate drone scan result
        scan_result = {
          drone_id: "DJI-PHX-179",
          site_code: "PHX-DC21",
          battery: "84%",
          racks_scanned: 8,
          thermal_alerts: 0,
          timestamp: Time.current.iso8601,
          status: "completed"
        }

        Rails.logger.info("[DJI-PHX-179] Scan completed: #{scan_result}")

        render json: scan_result, status: :created
      end
    end
  end
end
