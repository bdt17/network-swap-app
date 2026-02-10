class DispatchController < ApplicationController
  def index
    @jobs = [
      { id: 2001, tech: "Smith,J.", status: "En Route", progress: 87, site: "Phoenix DC21" },
      { id: 2002, tech: nil, status: "Available", rack: "Rack 3" }
    ]
    
    @techs = [
      { name: "Smith, J.", status: "Active", location: "Phoenix DC21" },
      { name: "Jones, M.", status: "Available", location: "Shop" }
    ]
  end
end
