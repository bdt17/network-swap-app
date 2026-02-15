class Inspection < ApplicationRecord
  belongs_to :drone_fleet
  belongs_to :site
  enum severity: { low: 0, medium: 1, high: 2, critical: 3 }
end
