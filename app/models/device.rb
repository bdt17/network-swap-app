class Device < ApplicationRecord
  belongs_to :site
  has_many :swap_tickets, dependent: :destroy
  
  validates :mac_address, presence: true, uniqueness: true
  validates :model, presence: true
  validates :status, presence: true, inclusion: { in: %w[active maintenance eol] }
  
  # ADD THESE SCOPES (FIXES ERROR)
  scope :active, -> { where(status: 'active') }
  scope :maintenance, -> { where(status: 'maintenance') }
  scope :eol, -> { where(status: 'eol') }
  
  scope :expiring_soon, -> { where('warranty_expires <= ?', 90.days.from_now) }
  
  def critical?
    status == 'eol' || warranty_expires&.past?
  end
end
