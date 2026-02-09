class SwapTicket < ApplicationRecord
  belongs_to :device
  belongs_to :site
  enum :status, { pending: 0, scheduled: 1, completed: 2 }
  validates :vendor, :scheduled_at, presence: true
  has_many :audit_logs, dependent: :destroy
end
