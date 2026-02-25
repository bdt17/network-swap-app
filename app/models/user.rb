class User < ApplicationRecord
  # Devise REMOVED for Render production deploy
  # Original Devise modules were broken (gem not installed)
  
  # PROD fields for Network Swap
  validates :email, presence: true, uniqueness: true
end
