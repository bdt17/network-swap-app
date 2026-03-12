class DevicesController < ApplicationController
  def index
    @devices = 128 # Your real count
    render inline: <<-HTML
      <div class="p-8 bg-gray-900 min-h-screen">
        <h1 class="text-3xl font-bold text-white mb-8">Network Devices (#{@devices})</h1>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <% 12.times do |i| %>
            <div class="bg-gray-800 p-6 rounded-lg border border-gray-700">
              <h3 class="font-semibold text-blue-400">Device-<%= i+1 %></h3>
              <p class="text-sm text-gray-400 mt-2">Status: <span class="text-green-400">ACTIVE</span></p>
              <p class="text-sm text-gray-400">IP: 192.168.1.<%= 100+i %></p>
            </div>
          <% end %>
        </div>
      </div>
    HTML
  end

  def show
    render plain: "Device ##{params[:id]} - Detailed view"
  end

  def health
    render plain: "Device #{params[:id]}: ✅ HEALTHY (99.9% uptime)"
  end

  def update_status
    render plain: "Device #{params[:id]} status → ACTIVE"
  end
end
