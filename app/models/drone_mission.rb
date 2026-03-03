class DroneMission < ApplicationRecord
  belongs_to :drone
  belongs_to :site
end
