class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Devise REMOVED for Render production deploy
  # Original Devise modules were broken (gem not installed)
  
  # PROD fields for Network Swap
  validates :email, presence: true, uniqueness: true
end
