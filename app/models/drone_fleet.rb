class DroneFleet < ApplicationRecord
  # NO belongs_to associations
  validates :serial_number, presence: true, uniqueness: true
  
  scope :available, -> { where('battery_status > 25') }
end
