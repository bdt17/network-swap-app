class FieldTech < ApplicationRecord
  self.table_name = "field_techs"
  
  devise :database_authenticatable, :trackable
  validates :ar_glasses_token, presence: true, uniqueness: true
end
