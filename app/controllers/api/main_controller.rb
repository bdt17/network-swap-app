require 'securerandom'
require 'csv'
require 'open-uri'

class Api::MainController < Api::ApplicationController
  def dispatch_sms
    data = params.require(:dispatch).permit(:tech, :device).to_h
    tech = data[:tech] || params[:tech]
    device = data[:device] || params[:device]
    
    # Simulate SMS dispatch (replace with Twilio/SMS service)
    response = {
      success: true,
      message: "SMS dispatched to #{tech} for #{device}",
      tech: tech,
      device: device,
      timestamp: Time.current
    }
    
    render_json(response)
  rescue => e
    render_json({error: e.message}, :unprocessable_entity)
  end
  
  def health
    device_id = params[:id]
    device = {id: device_id, status: 'healthy', uptime: 99.9, last_check: Time.current}
    render_json(device)
  end
  
  def export_csv
    devices = [
      {id: 1, name: 'C9300-1', status: 'active', location: 'DC1'},
      {id: 2, name: 'C9300-2', status: 'active', location: 'DC2'},
      {id: 3, name: 'C9300-3', status: 'maintenance', location: 'DC1'}
    ]
    
    csv_data = CSV.generate do |csv|
      csv << ['id', 'name', 'status', 'location']
      devices.each { |d| csv << [d[:id], d[:name], d[:status], d[:location]] }
    end
    
    send_data csv_data,
              type: 'text/csv',
              filename: "devices-#{Time.current.strftime('%Y%m%d')}.csv"
  end
end
