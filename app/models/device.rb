class Device < ApplicationRecord
  self.inheritance_column = nil  # ← DISABLES STI magic
  belongs_to :site
  enum status: { active: 0, eol: 1, scheduled: 2 }
  enum device_type: { switch: 0, printer: 1, camera: 2, ap: 3 }  # Renamed from 'type'
end
