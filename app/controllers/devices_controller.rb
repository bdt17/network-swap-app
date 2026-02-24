class DevicesController < ApplicationController
  def index
    @devices = [{id: 1, name: "Cisco Catalyst 9300", site: "PHX-DC21", status: "active"}]
    render layout: false
  end
end
