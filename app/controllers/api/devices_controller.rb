module Api
  class DevicesController < ApplicationController
    def index
      devices = [
        {id: 1, name: "SW-CORE-01", model: "Cisco Catalyst 2960", site: "Phoenix HQ", eos_days: 342, status: "active"},
        {id: 2, name: "AP-FLOOR2-03", model: "Aruba AP-515", site: "Phoenix HQ", eos_days: 187, status: "active"},
        {id: 3, name: "PRINTER-EXEC", model: "HP LaserJet Pro", site: "Phoenix HQ", eos_days: 89, status: "critical"}
      ]
      render json: devices
    end

    def critical
      render json: [{name: "SW-CORE-01", eos_days: 89, priority: "IMMEDIATE"}]
    end
  end
end
