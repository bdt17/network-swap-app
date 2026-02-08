module Api
  class DevicesController < ApplicationController
    def index
      devices = Device.where(status: 'active').limit(100)
      render json: devices.map { |d| d.as_json.merge(eol_days: (d.eos_date - Date.today).to_i) }
    end
  end
end
