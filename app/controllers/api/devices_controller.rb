module Api
  class DevicesController < ApplicationController
    def index
      render json: [
        {id: 1, name: 'Cisco-2960-24TT', status: 'critical'},
        {id: 2, name: 'Aruba-AP-305', status: 'online'}
      ]
    end
  end
end
