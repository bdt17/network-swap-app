class SitesController < ApplicationController
  def index
    @sites = [
      {id: 1, code: "PHX-DC21", name: "Phoenix DC21", racks: 12, status: "active"},
      {id: 2, code: "PHX-DC22", name: "Phoenix DC22", racks: 8, status: "active"}
    ]
    render layout: false
  end
end
