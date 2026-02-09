class Tech < ApplicationRecord
  belongs_to :site
  has_many :swap_tickets, foreign_key: :tech_id
  enum role: { lead: 0, senior: 1, junior: 2 }
  enum status: { available: 0, busy: 1, on_leave: 2 }
  
  scope :available, -> { where(status: :available) }
  scope :by_site, ->(site_id) { where(site_id: site_id).available }
end
