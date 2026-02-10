class Tech < ApplicationRecord
  enum :status, { available: 0, active: 1, en_route: 2, complete: 3 }

  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A\+1\d{10}\z/ }
end
