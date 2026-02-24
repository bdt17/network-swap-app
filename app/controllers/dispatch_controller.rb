class DispatchController < ApplicationController
  def tower
    @towers = [{id: 1, name: "PHX-DC21 Tower A", status: "ready", tech: "Brett Thomas"}]
    render layout: false
  end
end
