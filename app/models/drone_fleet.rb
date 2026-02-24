class DroneFleet < ApplicationRecord
  validates :name, :vendor, :base_location, presence: true
  validates :max_operational_range_km, numericality: { greater_than: 0 }, allow_nil: true
  
  has_many :drones, dependent: :destroy
  scope :active, -> { where(status: "active") }
end
