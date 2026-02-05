class SwapTicket < ApplicationRecord
  enum status: {
    pending: 0,
    scheduled: 1,
    in_progress: 2,
    completed: 3,
    failed: 4
  }
end
