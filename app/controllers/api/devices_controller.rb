module Api
  class DevicesController < ApplicationController
    def index
      render json: [
        {id: 1, name: "SW-CORE-01", model: "Cisco 2960", site: "Phoenix HQ", eol_days: 342},
        {id: 2, name: "AP-FLOOR2-03", model: "Aruba AP-515", site: "Phoenix HQ", eol_days: 187},
        {id: 3, name: "PRINTER-EXEC", model: "HP LaserJet", site: "Phoenix HQ", eol_days: 89}
      ]
    end
  end
end
