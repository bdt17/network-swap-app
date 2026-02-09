class AuditLog < ApplicationRecord
  belongs_to :swap_ticket
  validates :action, :timestamp, :metadata, presence: true
end
