class SwapTicket < ApplicationRecord
  belongs_to :device
  belongs_to :site
  enum status: { pending: 0, processing: 1, completed: 2 }
end
