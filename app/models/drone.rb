class Drone < ApplicationRecord
  belongs_to :fleet, class_name: "DroneFleet"
  has_many :drone_missions          # PHASE 14 - Mission tracking
  validates :identifier, presence: true

  def online?
    status == "online" && (battery_level || 0) > 20
  end
end
