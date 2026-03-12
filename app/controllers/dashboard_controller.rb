class DashboardController < ApplicationController
  def index
    @devices_count = Device.count
    @drones_count = 2  # DJI-PHX-179 + backup
    @sites_count = Site.count 
    @swaps_count = 23
    @current_time = Time.now
  end
  
  def tech
    @devices = Device.all
  end
end

  def tech
    render inline: "<h1>Tech Dashboard</h1><p>Network Operations Center</p>"
  end

  def tech
    render inline: <<-HTML
      <div class="p-8 bg-gray-900 text-white">
        <h1 class="text-3xl font-bold mb-4">Tech Dashboard</h1>
        <p>Thomas IT Network Operations Center - Technical View</p>
        <div class="mt-4 grid grid-cols-3 gap-4 text-sm">
          <div class="bg-gray-800 p-4 rounded">Networks: 47</div>
          <div class="bg-gray-800 p-4 rounded">Devices: 128</div>
          <div class="bg-gray-800 p-4 rounded">Swaps: 23</div>
        </div>
      </div>
    HTML
def tech
  render inline: "<div class='p-8 bg-gray-900 text-white'><h1 class='text-3xl'>Tech Dashboard</h1><p>Thomas IT NOC - Technical View</p></div>"
end
end

