class SwapTicket < ApplicationRecord
  STATUS_MAP = {
    0 => 'pending',
    1 => 'assigned', 
    2 => 'en_route',
    3 => 'complete',
    4 => 'cancelled'
  }.freeze

  before_validation :set_production_defaults

  def status_name
    STATUS_MAP[status&.to_i] || 'unknown'
  end

  private

  def set_production_defaults
    self.device_id     ||= Time.current.to_i + rand(10000)  # UNIQUE timestamp
    self.site_id       ||= 1
    self.vendor        ||= 'Cisco'
    self.status        ||= 0
    self.assigned_tech_id ||= 1
    self.scheduled_at  ||= 1.day.from_now
  end
end
