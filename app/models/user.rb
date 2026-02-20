class User < ApplicationRecord
  # Include default devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  # PROD fields for Network Swap
  validates :email, presence: true, uniqueness: true
end
