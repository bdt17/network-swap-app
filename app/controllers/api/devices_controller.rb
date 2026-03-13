class Api::DevicesController < ApplicationController
  def index
    render json: [{id: 1, name: "Cisco C9300", status: "operational", site: "Phoenix DC21"}]
  end
  
  def show
    render json: {id: params[:id], health: "green"}
  end
  
  def health
    render json: {device: params[:id], status: "green", uptime: "99.9%"}
  end
  
  def csv_export
    # Phase 6: Production CSV
    csv = "ID,Name,Status,Site\n1,Cisco C9300,operational,Phoenix DC21\n"
    send_data csv, filename: "devices.csv", type: "text/csv"
  end
end
