class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @user = current_user
    @tickets = [
      {id: 2001, site: 'PHX-DC1', device: 'Cisco-2960-24TT', status: 'critical'},
      {id: 2002, site: 'DEN-DC1', device: 'Aruba-AP-305', status: 'high'}
    ]
  end
end
