class Drone < ApplicationRecord
  belongs_to :fleet, class_name: "DroneFleet"
  validates :identifier, presence: true
  
  def online?
    status == "online" && (battery_level || 0) > 20
  end
end
