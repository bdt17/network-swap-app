class DronePolicy < ApplicationPolicy
  def fleet? 
    user.has_role?('drone_operator') || user.has_role?('noc_admin')
  end
  
  def inspect?
    user.has_role?('drone_operator') || user.has_role?('noc_admin')
  end
  
  def control?
    user.has_role?('drone_operator') || user.has_role?('noc_admin')
  end
end
