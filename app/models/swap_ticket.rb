class SwapTicket < ApplicationRecord
  STATUS_MAP = {
    0 => 'pending',
    1 => 'assigned', 
    2 => 'en_route',
    3 => 'complete',
    4 => 'cancelled'
  }.freeze

  def status_name
    STATUS_MAP[status] || 'unknown'
  end

  def status=(value)
    if value.is_a?(Symbol)
      self[:status] = STATUS_MAP.key(value.to_s) || 0
    else
      self[:status] = value
    end
  end

  belongs_to :device, optional: true
  belongs_to :tech, optional: true, class_name: 'Tech'

  validates :device_id, presence: true
  validates :site, presence: true
end
