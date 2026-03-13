class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
  
  scope :drone_operator, -> { joins(:role).where(roles: {name: 'drone_operator'}) }
  scope :noc_admin, -> { joins(:role).where(roles: {name: 'noc_admin'}) }
end
