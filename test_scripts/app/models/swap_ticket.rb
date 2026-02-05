class SwapTicket < ApplicationRecord
  enum :status, {
    pending: 0,
    scheduled: 1,
    in_progress: 2,
    completed: 3,
    failed: 4
  }

  # other associations/validations here
end



#class SwapTicket < ApplicationRecord
 # enum :status, { pending: 0, scheduled: 1, in_progress: 2, completed: 3, failed: 4 }
#end


#class SwapTicket < ApplicationRecord
 # enum :status, { pending: 0, scheduled: 1, in_progress: 2, completed: 3, failed: 4 }
  # Add your associations/validations here
#end
