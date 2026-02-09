class Drone < ApplicationRecord
  belongs_to :drone_fleet
  belongs_to :site
end
