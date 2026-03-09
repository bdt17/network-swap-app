  # Add this method to existing controller
  def health
    device = Device.find(params[:id])
    render json: { score: device.health_score, issues: device.health_issues }
  end

  def export
    require 'csv'
    csv = Device.all.to_csv
    send_data csv, filename: "devices-#{Date.today}.csv"
  end
