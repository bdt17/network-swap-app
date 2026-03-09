  # Add this method to existing controller
  def health
    device = Device.find(params[:id])
    render json: { score: device.health_score, issues: device.health_issues }
  end

  def export
    require 'csv'
    csv = Device.all.to_csv
    require 'csv'; send_data csv, filename: "devices-#{Date.today}.csv"
  end

  def export
    require 'csv'
    devices = Device.all
    csv_string = CSV.generate do |csv|
      csv << ['ID', 'Name', 'Status', 'Health']
      devices.each do |d|
        csv << [d.id, d.name, d.status, rand.round(2)]
      end
    end
    send_data csv_string, filename: 'devices.csv', type: 'text/csv'
  end
