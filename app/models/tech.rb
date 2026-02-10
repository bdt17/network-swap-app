class Tech < ApplicationRecord
  STATUS_MAP = {
    0 => 'available',
    1 => 'active', 
    2 => 'en_route',
    3 => 'complete'
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

  validates :name, presence: true
  validates :phone, format: { with: /\A\+1\d{10}\z/ }, allow_blank: true
end
