class Api::DevicesController < Api::ApplicationController
  def index
    render json: [
      {id: 1, name: "Cisco C9300-Rack1U", status: "operational", site: "Phoenix DC21"},
      {id: 2, name: "Aruba AP-515", status: "active", site: "Phoenix DC21"}
    ]
  end

  def show
    render json: {id: params[:id], name: "Cisco C9300", status: "green"}
  end

  def health
    render json: {
      device: params[:id],
      status: "green",
      uptime: "99.9%",
      site: "Phoenix DC21"
    }
  end

  def export
    csv = "ID,Name,Status,Site\n1,Cisco C9300-Rack1U,operational,Phoenix DC21\n2,Aruba AP-515,active,Phoenix DC21"
    send_data csv, filename: "devices-#{Date.today}.csv", type: 'text/csv'
  end
end
