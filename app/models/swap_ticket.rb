class SwapTicket < ApplicationRecord
  belongs_to :device, optional: true
  belongs_to :site
end
