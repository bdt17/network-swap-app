module Api
  class DispatchController < ApplicationController
    def index
      render json: [
        {id: 1, device: 'Cisco-2960-24TT', site: 'PHX-DC1', tech: 'Smith,J. #2001', priority: 'critical', eta: '2hr'},
        {id: 2, device: 'Aruba-AP-305', site: 'DEN-DC1', tech: 'Garcia,M. #2005', priority: 'high', eta: '4hr'}
      ]
    end
  end
end
